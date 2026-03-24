Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJfaAlWJw2nJrQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80517320699
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5097C8F288;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9EC0C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:28:48 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-35a07c4b17dso2114453a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376927; x=1774981727;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
 b=rWmDajdP/4n1AyNqlYkjvTlucyZtCi+QDFiv+vSjuOM3shC3GZQG1+o+dgq52jOC1F
 aW7iklf04RGtAwVkeBFr53EyMBGp2rHGqyN2pVOn59Wm+SzvdnxYAN7QkZY+rkNoxSGW
 VPHACbhh2O+GxsOG5GSRpQf7E5Q5F66g92bxdlGiCjsvTRmKPjyChgWKQ7fKUBAs5/w9
 SZNSVW3A7ifU86bko3PE3e562BGoYtNX6IAd1RIsKgF+zP+7VdMgHSClxjwhtpz2v6eU
 2G4q6xmglhj2AvwBA0DxNegFBDwN53ZzrpBWIjHg6SrO+hU4pLP5QacL8Z/Ao0sBMzm4
 2DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376927; x=1774981727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
 b=TcLbvZ5Zcbifie4jnCthmBstFRI+AllE9VErjsWj4JOaMumahLUNZ2mVnXM8brEHFz
 Mj97z2JckuBkq5FjYIHGDUTAXBh/x2UGWQt2Ttc8TdWD/dvGUg53prvCZAqV39eiuvuf
 /EcFld14nCHTqnEVnBk/wCJOn21TTQCt0s8FNm3/JsDWIQQaEuN0QyswYlybmnPSigoM
 mfxcxZpwg9wljewoT1Iw7yPJ/T2dLl0O/3bWr+AD61UlJqWOlW+Q1/Zqg+b/bbvWxdId
 XWlHJoLBRkgPwLgZNhd9a6QHc8lZc+tK5S8INE20u0ctWwEqNfZnIxqQtcCGWM6W4ArH
 QSCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW55KbTH1c72XRyxVdBPSPeICkG2s0em5US51eJnyrjLvjAHnsFGhNENIl5tpRk7nyybw2fSlmojiH6pg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzbsVmxWl/l34jNKLOTXniruKFQV33MualtNn62pHxSKslDW7DW
 BzRhsMn/VnnuU8XtvDGi5T/MHRDFn+AXAJ/700dLfu/ljBMWDlY6Nr6a
X-Gm-Gg: ATEYQzx49uULDNUMCytZSson/QyqgBxE6tmtsWxCqHxKgfX9qYRh+2eC5R+o0ppn7+k
 MBoe3rRHnFYpy/nR5Hnd2uOIGL5g2UosraJJDwd8q7AGcvrQ74HDH4jQRV/kYD5pZJTdgNXhnL1
 l2k+F6GGFGGyULrjLWIcMb+80CIb2FzwZSbraUZUoAd3UEZBxnnwKQjHIrzRz93wCd8xvYAM6Yl
 JNNvm8OyPFMGf79AtTqldkBPIpY4zcZsRHF0AxzS9NYwvTSb3VPS57qthLxTED52FhT52bi8jK/
 t9yZG4yKntu5tr2A1dIVGFaLnxlE3r69bGWAMVS83vCXpY9eodiLcCGMn0TeQTfQpLBANUn5Afz
 CTx+m0qeRQNaUgIg6KXR3MowUTPKgy8eLpcs8CycH0GnFj1GQfSeiDt+/dJerIm2bGvW0DQZqsC
 uy2/go8TrH2t1+zJUggk2+RRoCwzL67he/MSDv
X-Received: by 2002:a17:90b:1d8a:b0:35b:e5ba:c0c8 with SMTP id
 98e67ed59e1d1-35c0ddd9ed9mr320446a91.28.1774376927304; 
 Tue, 24 Mar 2026 11:28:47 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:28:46 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:57 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-9-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2523;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=2gYAVvyUJk/qxHL4KJceROL4iNDzsuJ4eDXGcgjkpVk=;
 b=vB2gL2qhGY3YL/cIJqmvowLCaQEngaBk72sJRkrwCl3oRTHnnpcQvD7hzPfvDqHKUYnT4Wr6Y
 Zfn7Uu0NXm6B/rb6bM9jYBJr8GEREU1oPwc+1RRqWHn4xFjESwTrs7U
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 09/10] i2c: sis96x: Replace dev_err() with
 dev_err_probe() in probe function
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:atharvd440@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[harbaum.org,kernel.org,nvidia.com,gmail.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.978];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,sis96x_driver.name:url]
X-Rspamd-Queue-Id: 80517320699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis96x.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..eee41dc9d706 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -245,23 +245,19 @@ static int sis96x_probe(struct pci_dev *dev,
 	u16 ww = 0;
 	int retval;
 
-	if (sis96x_smbus_base) {
-		dev_err(&dev->dev, "Only one device supported.\n");
-		return -EBUSY;
-	}
+	if (sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EBUSY, "Only one device supported.\n");
 
 	pci_read_config_word(dev, PCI_CLASS_DEVICE, &ww);
-	if (PCI_CLASS_SERIAL_SMBUS != ww) {
-		dev_err(&dev->dev, "Unsupported device class 0x%04x!\n", ww);
-		return -ENODEV;
-	}
+	if (ww != PCI_CLASS_SERIAL_SMBUS)
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Unsupported device class 0x%04x!\n", ww);
 
 	sis96x_smbus_base = pci_resource_start(dev, SIS96x_BAR);
-	if (!sis96x_smbus_base) {
-		dev_err(&dev->dev, "SiS96x SMBus base address "
-			"not initialized!\n");
-		return -EINVAL;
-	}
+	if (!sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EINVAL,
+				     "SiS96x SMBus base address not initialized!\n");
+
 	dev_info(&dev->dev, "SiS96x SMBus base address: 0x%04x\n",
 			sis96x_smbus_base);
 
@@ -272,9 +268,9 @@ static int sis96x_probe(struct pci_dev *dev,
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(sis96x_smbus_base, SMB_IOSIZE,
 			    sis96x_driver.name)) {
-		dev_err(&dev->dev, "SMBus registers 0x%04x-0x%04x "
-			"already in use!\n", sis96x_smbus_base,
-			sis96x_smbus_base + SMB_IOSIZE - 1);
+		dev_err_probe(&dev->dev, -EINVAL,
+			      "SMBus registers 0x%04x-0x%04x already in use!\n",
+			      sis96x_smbus_base, sis96x_smbus_base + SMB_IOSIZE - 1);
 
 		sis96x_smbus_base = 0;
 		return -EINVAL;
@@ -287,7 +283,7 @@ static int sis96x_probe(struct pci_dev *dev,
 		"SiS96x SMBus adapter at 0x%04x", sis96x_smbus_base);
 
 	if ((retval = i2c_add_adapter(&sis96x_adapter))) {
-		dev_err(&dev->dev, "Couldn't register adapter!\n");
+		dev_err_probe(&dev->dev, retval, "Couldn't register adapter!\n");
 		release_region(sis96x_smbus_base, SMB_IOSIZE);
 		sis96x_smbus_base = 0;
 	}

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
