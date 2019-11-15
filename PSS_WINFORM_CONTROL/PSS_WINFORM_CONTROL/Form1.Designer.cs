namespace PSS_WINFORM_CONTROL
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
            this.model1View1 = new PSS_WINFORM_CONTROL.Views.Model1View.Model1View();
            this.SuspendLayout();
            // 
            // model1View1
            // 
            this.model1View1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.model1View1.Location = new System.Drawing.Point(0, 0);
            this.model1View1.Name = "model1View1";
            this.model1View1.Size = new System.Drawing.Size(1051, 477);
            this.model1View1.TabIndex = 0;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1051, 477);
            this.Controls.Add(this.model1View1);
            this.Name = "Form1";
            this.Text = "Admin Management";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.ResumeLayout(false);

        }

        #endregion

        private Views.Model1View.Model1View model1View1;
    }
}

