<?php

namespace DoctrineMigrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20170530005244 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('DROP TABLE migration_infotownlinkwp');
        $this->addSql('DROP INDEX dtb_customer_email_idx');
        $this->addSql('ALTER TABLE dtb_customer ALTER buy_times SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE dtb_customer ALTER buy_total SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE dtb_customer_favorite_product ALTER flag SET DEFAULT 0');
        $this->addSql('ALTER TABLE dtb_tax_rule ALTER tax_rate SET DEFAULT \'8\'');
        $this->addSql('ALTER TABLE dtb_tax_rule ALTER tax_adjust SET DEFAULT \'0\'');
        $this->addSql('DROP INDEX dtb_page_layout_url_idx');
        $this->addSql('DROP INDEX dtb_order_order_email_idx');
        $this->addSql('DROP INDEX dtb_order_pre_order_id_idx');
        $this->addSql('ALTER TABLE dtb_order ALTER discount SET DEFAULT \'0\'');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('CREATE TABLE migration_infotownlinkwp (version VARCHAR(255) NOT NULL, PRIMARY KEY(version))');
        $this->addSql('CREATE INDEX dtb_page_layout_url_idx ON dtb_page_layout (url)');
        $this->addSql('ALTER TABLE dtb_order ALTER discount SET DEFAULT \'0::numeric\'');
        $this->addSql('CREATE INDEX dtb_order_order_email_idx ON dtb_order (order_email)');
        $this->addSql('CREATE INDEX dtb_order_pre_order_id_idx ON dtb_order (pre_order_id)');
        $this->addSql('ALTER TABLE dtb_customer_favorite_product ALTER flag DROP DEFAULT');
        $this->addSql('ALTER TABLE dtb_tax_rule ALTER tax_rate SET DEFAULT \'8::numeric\'');
        $this->addSql('ALTER TABLE dtb_tax_rule ALTER tax_adjust SET DEFAULT \'0::numeric\'');
        $this->addSql('ALTER TABLE dtb_customer ALTER buy_times SET DEFAULT \'0::numeric\'');
        $this->addSql('ALTER TABLE dtb_customer ALTER buy_total SET DEFAULT \'0::numeric\'');
        $this->addSql('CREATE INDEX dtb_customer_email_idx ON dtb_customer (email)');
    }
}
