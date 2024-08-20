Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C795875F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 14:52:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70313C6DD6B;
	Tue, 20 Aug 2024 12:52:34 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F7DBCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 12:52:27 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso625866866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724158346; x=1724763146;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Knx/Wm8d04mP0mUth0cL+YGIY2+xGYXs0Lh/UFhf76o=;
 b=H0NDAhTY8xwbcpim8kygUGt8EYuNoy142rDSW0DVXFnwuoXR/G4D9zUvSUn4Gi8wcK
 F3HR76Q7SYSaGGN3xk3xHfx0YBt7/RLmdOms0ueh38pevS5JKK+sD8sjVpyTyiTg3Vrp
 +onvf8L4x/qj3knWn/9Hiw8fAZiIaiIBInJXEPQeFRgyGT2EfDRSpnlSJ2nAlIBleADD
 VwBuWlXyqtTMPxyOQezO+Pi+C8TsOv2ers2nWhZW9EUoHq1St8jlAA6WZnGl0AfK0JTR
 wtDCEaM3TmWTwFZT3two9vOa3e7i/I/p31o9yGPBr01wSFJsh5lSjQ3aFYP4KAbZenI8
 +EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724158346; x=1724763146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Knx/Wm8d04mP0mUth0cL+YGIY2+xGYXs0Lh/UFhf76o=;
 b=ucE1pmifz3A+EBuNKiX9yMsM4xWSPrp3eK40Gf4EANrWejZb8yXhWrdX+cE3IhYmzX
 NWxe/ynxpCvAaq2GDj+bbSK106sMytMNmaRLLGPzpVNNlzsJBkS4rO1CQi2Dc5/L9969
 t3vEhnY3/tjDtO+iU5yObE2Fey+14Sssb9qCTc7iB4VP0SyLIH8ad57DlGcGiyvLian/
 BrV87PZG7C3Zl+o1FLRXWwZ8CCuslDbmxnb7FiD+onLKgEzmcWTIV60bAlR8OlpEiFa8
 ZcRjVQB+ZNSlqMEbs5Rt7aKnVn0tskmRyCBiK4vOpdI/L9wDq07O/nOugeOd3N7+4RRZ
 jXAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNN4zVVWwMsWbBHYLKVMVeGLHB5kotqzBsZjVbWB6FqEcwkao5sSgOryI7sTtTa0A0YzWWpVS6/qJzAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwrFBWsmYwzpNcIsnNaglVwpO7zvQKu4flBJfuG2Nl97o+Z8ciD
 tzOEdg3AW4aiLQv3Htbb0jAJAfd9y+0skH9Wp0DJhwLC5S1TpkHP
X-Google-Smtp-Source: AGHT+IELQXfyg2G1L4D9vQw2uIX24lD9ZaNlxT9BSo4Kp7kVm3c1WwrsSrVTXpg6pVqMkwFN2/fdDQ==
X-Received: by 2002:a17:907:9717:b0:a72:6b08:ab24 with SMTP id
 a640c23a62f3a-a83928a4178mr1099966866b.14.1724158345821; 
 Tue, 20 Aug 2024 05:52:25 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6bfcsm762540966b.28.2024.08.20.05.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 05:52:25 -0700 (PDT)
Date: Tue, 20 Aug 2024 15:52:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240820125222.uia4m27wizy2767a@skbuf>
References: <cover.1724145786.git.0x1207@gmail.com>
 <bc4940c244c7e261bb00c2f93e216e9d7a925ba6.1724145786.git.0x1207@gmail.com>
 <20240820123456.qbt4emjdjg5pouym@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820123456.qbt4emjdjg5pouym@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/7] net: stmmac: refactor FPE
 verification process
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

On Tue, Aug 20, 2024 at 03:34:56PM +0300, Vladimir Oltean wrote:
> I took the liberty of rewriting the fpe_task to a timer, and delete the
> workqueue. Here is a completely untested patch, which at least is less
> complex, has less code and is easier to understand. What do you think?

I already found a bug in the code I sent, sorry. verify_limit needs to
be reset each time status is reset to ETHTOOL_MM_VERIFY_STATUS_INITIAL,
to allow for 3 retries on each clean-state verification process.

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 3eb5344e2412..530793bce231 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1333,7 +1333,6 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
 	fpe_cfg->tx_enabled = cfg->tx_enabled;
 	fpe_cfg->verify_time = cfg->verify_time;
 	fpe_cfg->verify_enabled = cfg->verify_enabled;
-	fpe_cfg->verify_limit = 3; /* IEEE 802.3 constant */
 	if (!cfg->verify_enabled)
 		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa74504f3ad5..a88ec40c4b6d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7405,6 +7405,7 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
 				     fpe_cfg->pmac_enabled);
 	} else {
 		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
+		fpe_cfg->verify_limit = 3; /* IEEE 802.3 constant */
 		stmmac_fpe_verify_timer_arm(fpe_cfg);
 	}
 }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
