Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BCA1A7EE
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 17:35:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61575C78F8B;
	Thu, 23 Jan 2025 16:35:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C242C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 16:35:19 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-21636268e43so24436335ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737650117; x=1738254917;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=37PCcaFsphtONjU1WuGj3LJHxxawzOceGVtfL5iTpqc=;
 b=H6kejPIBDIDiNwuviJ3vxae6F0GYyol8h0X73ItuBEP0t1HeRx3K+Vc+MkcpkZjjj6
 mBaDz/mtnin0zGLXa02/5IAz8cbNNptW8zimF4JSNi2utujfIrqCXyIrmGYwTc43OWnx
 15DEIA+VQwyoKsHZOlNuhKw4QFxr7sYrqZCwDsGWp8bQWSmDnnfuSoJZmEGnFwVnb2kD
 LaDFbXqJWV7/DrAiKBI/uLGQVBELmNZWqnXg8Gctjvh1lgcYZ4NQiMawMlReOkb3StkF
 BOeGB+IsvnTRHqOkfEhuGpDoSZJA4QRkavD2xXQsEAS8oGfgAT+VUzHIrZY139bP7RTj
 CK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737650117; x=1738254917;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37PCcaFsphtONjU1WuGj3LJHxxawzOceGVtfL5iTpqc=;
 b=TZR5476kV3e0J/QTToykNSYQ01fM1BxEqvhD9am2xWO7kpDVtA5tIOH7k6W2ONyvlM
 VDPBdxkxmN23gjlDSAEsENAgKgIcj3CedCYZxFPit3EJYZvwUWQVzUB+WH9zSQxdmb8p
 KJKeh4+RBBwffzf6EUsKyr+678X7E256lFMKPata/7oP/V8pq1h4wBNAkEe6cl0hllTV
 PTPDJLvGNCpuVh/6x56+jn9FwXNMjotTQs1CQug49RLPLen1xYebLYF/pgh3m7fRSZs0
 uw9bA65LKSYfcO/+HCCx5ydGxuirKn18yBA9dqbrTx7dguJHB1ipdGzPxfRsM9M8Bk3h
 mR2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS1SqRX8dUdZAgUAYcKBu2X0an3Baev/y0PJZYPt7SvTDSrbU6DolT5VFWbQJVLilOLhiyOSX00hi+xQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyfBsxwpY5ofkpwhz0jRn9BTLntrClZeTL07WH/14EulDPmo9U1
 blxmVbZWumIHaaomYCt1MZt3d6F1MRLTo3ORov/6lLhVunQm5U5k
X-Gm-Gg: ASbGncsr+qDExxWayt6ZSfX92+B3NzQyK54Hrh2Oh2+dipP2/1UqKboOqDUZahsKiA1
 w2BT0yXz7t7H32KZB9e2K1lZ51BI6d6osbzH3dB1E4gSeV0sUXPDIVze6wjlN6VLIro0Fd/kwoZ
 uq/rHZrrlK8aVKNO/BGscPrvnD3DubofwmoxLLgyHlovWQnRJSB0cN9tJir4LGbqp0bDG1nXBWr
 lGZWPDdBx2O7iOriGdGVQagfTdDCsJ6wZaPeWzhQ8znZdwQupgjNvvM4J2tZPJ4nsZHoppx17X+
 W+bMOug9
X-Google-Smtp-Source: AGHT+IFs4lUJjgFulZgoKt9vLCAMNVT+ssvpUR3RYJq7IZyHJnj6PWguIOa0Hbt9lV14uqVBhXgqSw==
X-Received: by 2002:a05:6a20:394b:b0:1e1:d22d:cf38 with SMTP id
 adf61e73a8af0-1eb214f0f61mr39291398637.21.1737650117287; 
 Thu, 23 Jan 2025 08:35:17 -0800 (PST)
Received: from orangepi5-plus ([129.146.253.192])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a76115bsm117705b3a.108.2025.01.23.08.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 08:35:16 -0800 (PST)
Date: Fri, 24 Jan 2025 00:35:01 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20250124003501.5fff00bc@orangepi5-plus>
In-Reply-To: <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/uWm=6.JKohvenzJ_Cv9eW2I"
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>, "David S.
 Miller" <davem@davemloft.net>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--MP_/uWm=6.JKohvenzJ_Cv9eW2I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jon,

On Thu, 23 Jan 2025 14:06:42 +0000, Jon Hunter wrote: 
> We have noticed a boot regression on -next when booting with NFS.
> Bisect is pointing to this commit and reverting this on top of -next
> does fix the problem.
> 
> I only see this on Tegra234 which uses the 
> drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c driver. Tegra194
> which uses the
> drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c driver
> appears to be fine.

What is the MTU of Tegra234 and NFS server? Are they both 1500?

Could you please try attached patch to confirm if this regression is
fixed?

If the attached patch fixes this regression, and so it seems to be a
cache coherence issue specific to Tegra234, since this patch avoid
memcpy and the page buffers may be modified by upper network stack of
course, then cache lines of page buffers may become dirty. But by
reverting this patch, cache lines of page buffers never become dirty,
this is the core difference.

--MP_/uWm=6.JKohvenzJ_Cv9eW2I
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=force-disable-rx-checksum.diff

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edbf8994455d..f00bcfc65dd0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5442,7 +5442,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
        struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
        struct stmmac_channel *ch = &priv->channel[queue];
        unsigned int count = 0, error = 0, len = 0;
-       int status = 0, coe = priv->hw->rx_csum;
+       int status = 0, coe = 0;
        unsigned int next_entry = rx_q->cur_rx;
        enum dma_data_direction dma_dir;
        unsigned int desc_size;

--MP_/uWm=6.JKohvenzJ_Cv9eW2I
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--MP_/uWm=6.JKohvenzJ_Cv9eW2I--
