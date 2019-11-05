namespace test7
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.model1View1 = new test7.Views.Model1View.Model1View();
            this.SuspendLayout();
            // 
            // model1View1
            // 
            this.model1View1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.model1View1.Location = new System.Drawing.Point(0, 0);
            this.model1View1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.model1View1.Name = "model1View1";
            this.model1View1.Size = new System.Drawing.Size(737, 342);
            this.model1View1.TabIndex = 0;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(737, 342);
            this.Controls.Add(this.model1View1);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private Views.Model1View.Model1View model1View1;
    }
}

