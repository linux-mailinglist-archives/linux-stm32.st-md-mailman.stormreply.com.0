Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE26I+i8oWmswAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:48:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C71BA413
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:48:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B405CC87EC5;
	Fri, 27 Feb 2026 15:48:55 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16838C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:48:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4830f029407so4041885e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772207334; x=1772812134;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=;
 b=UJ8DR4jK32EuwV39XmCq0dfuVaYp0DufzzCy0g92KgGBoRW7jZHGth15gYlVuKl2Ug
 4nNQq1gYSBjQvkfpplaYciiMBOgbKVR9X4r8MXRwR21IeOwwVF7u7e64i0zl7f0VLCb+
 KdbYyosXqJOrKMQnxB6cetXZqJ5phno/8fdivETF5Zf4Y/tHhGDEmXp3cdUe2okkVN+/
 zslWVzIvcxyR0sSR1BJ31O0YlCyf8Tqg8a7Keu3NeXroqonkENhjrfoO4BC9vT9+Mjz8
 P+QFwuEtRG8kM7wlE6OrvJpL8t7yTjpubmmQeqrQtOEjjA2G3Y7/pvLveFywXGD9smeO
 jgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772207334; x=1772812134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=;
 b=ByX5ogor3MiDGfZK/mIyWL5REtCmGRM9VUea1tVJAhITSncS5VN53nApkaLcTXif6G
 oM6M/lGCEoUczOdNb6FcvLDTyH/pk79mwC/JtwXPu3FsBP7FG+PSFyyLlPj1Hfrw8XMA
 NUy+CJcV874DbuMrLRLq9yH2LehPeomSVB1tYIN2Cwp0iFPZtsO/0SouuJvMIcobjOib
 nb9vXHdsJNLPkvh3WabK61HFJW2GmqgpAf3quPygPTiixffWSqAagHdY4s5OchhNMOnB
 9sO2+v7fiQp1vT+uVnCV/TcOcEum264bzcE9DuP8vD4Hr5eH1oMQ8eykZDuFDR1LsmNz
 Q3Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSx1iYJqBWuvf1wxGBCLdfnRAMBFAsBGwPpGcP7LnzIr/umA2x/VZ+1/mcMl5i2mjU3uTKtGzgYjSkqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyP4zRR1HFt55x4f4Tgbv9Z+PyTbxmeTEfs0gb2aqVRRdFsa+gp
 72QImqQkDqwDm94XrxMmOthtMuJxKJg7r+JonYrPjP04y1n5Mq5PXIyj
X-Gm-Gg: ATEYQzwvNyzeHuC/DYCc+CJ7OytsNIpRkbTOjUUoDNjRsGNTLU/f8yxhd3Yxw0zcHEs
 Gaxf6oIb9Jy38bg35w3cArizVOJYNduAuU+YRQbvjQYCRAIrBHimSM+tkOYuNwaN2C1cdHqmuTh
 zn8MNXcsY2DSOz2sz57htF3Mcvn9tdWi6miJuYy2wH8AO//MELa3JeXI3NZH+W6iQuGm7sEpkVe
 IgIHL0GbDrTY0qHUA1NVs0ZWA+f6QDTZRECKpmf4XRs5bBjd1Qa+PmyQF4MsjDs5lBW32qY8k9l
 yLssErl4HUls9BMzPUVr9tkoauGnwREirpPvtdANBkZL1HKWAM6EsGFuFVcGp3Z7F6bKDsD5uLI
 AYnDWXFlZ4Lbq2AqsEzj5EV6nbofy7Sy3zLm4wJtNk4byjzxYclgetOY/pMYK+Zq8IoO/QRAXex
 UN3DCtt2lM/rs8tA==
X-Received: by 2002:a5d:5c89:0:b0:435:f96f:3517 with SMTP id
 ffacd0b85a97d-4399de241bamr3355441f8f.3.1772207334184; 
 Fri, 27 Feb 2026 07:48:54 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c76c49fsm8168270f8f.38.2026.02.27.07.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:48:53 -0800 (PST)
Date: Fri, 27 Feb 2026 17:48:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "Paolo Abeni <pabeni@redhat.com>, David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <20260227154850.hcz4ftt3aah7robh@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 0/8] net: stmmac:
 qcom-ethqos: further serdes reorganisation
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:edumazet@google.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux@armlinux.org.uk,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:url,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 207C71BA413
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:07:16PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC. This is replaced with phy_set_mode_ext().
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> Mohd has tested this series, but it would be great to get acks/reviews
> from the generic PHY maintainers.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 +++--------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 57 insertions(+), 36 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

Reiterating Vinod's request to netdev maintainers from here, just
because it's easy to get lost in the multiple patch versions:
https://lore.kernel.org/netdev/aaGgWUpM2A5y11Wh@vaman/

Can we please get a tag to pull into linux-phy when this gets merged
in net-next? I'm also working on a patch set for phy-next which will
conflict with this series.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
