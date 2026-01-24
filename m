Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sz2kHoAMdGlV1wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 01:04:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5527B944
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 01:04:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86437C87EDF;
	Sat, 24 Jan 2026 00:04:15 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06125C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 00:04:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id
 ffacd0b85a97d-4359309bf32so358637f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 16:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769213053; x=1769817853;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=;
 b=fbSYIFqKtc7qrJkAllqdGy/i0633JSIlhy6rrFtxR8er25Z7uC/HkMlnb2mq9lk37s
 w/Qk/9SJ9D71WXG81xqI0rviHvjT3D4cRyPRlrOb7c5+QQFCfyIvqTlGSpbmnqpt9LrZ
 1lL3ZU4WV8eQMg/TJWyfBOFcWdFt0BG1pIcA7YAep1lDrhtf18P2uJNyHaG78BXkIp4B
 w6887NpZCy1QcuqEB5nKoqnMTU+/ZjuRSusIV3gzEfVyYK4P519zw1qncWFwrI9UPDvB
 ndoEyIC1stH5gyYyyw+ousVGkXhKpri89k+Sf4i0uy/Kv1DmLpWPioH5i5X5S5uNgiRv
 mo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769213053; x=1769817853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=;
 b=kTlQ/p9owjzYZU72JT7/+OYBLY7/ZkTQ7Oq0yQwjDRPJmmw9PabsOsKznGAq4WPih2
 gSuwwifeUNhaP2VtEuGDmyQF3W8KgGkJfAuRVICHXJXHFcd0uStfoo9AJ8oOy52capRc
 v0oDU0ZuY5l24PttpstvJLv4t66+5MX2X9unJVdYZ/PZPZDt1Iqb+dUYHzVnMpdXqyyz
 35sMcevFk9ZMihggfaYF3GZMUD1i0AsaTgE4TDqDvjMx9Mjr7LSOzLJQsdDoSuRnm2Ak
 UpwlyDOaZBwJNeDMO7ZTajYofUhTAcZNby9X/zO77sVPj/+6Tpo19/orNdmGG83Y0ct6
 Wk/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF7Ym3GAydyp5lhQ7oNYtQJQrC8ooSUmc9mVWOqv0CPFQuef2pKmh7bBXlO+17+UdSaIlexWraqtE/Yg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxhjKFzGOgZYGfMFoGmvZbKGHEMNgiInShO1VuIxil7443u+qYa
 ohxULA6INGjsUJHFs7+99QJ7DZkLzh5fe2RXXGQRg8H0st36GEj3Hq3e
X-Gm-Gg: AZuq6aJJOikmR/rsYZ5swt6MOLQALGeOKq8U1Q2JQuk1DyTuPPBQtpu+lYN/icMwz2l
 CyKfje6aBYSWi5RlOLFKj3lgK+R0n8KjbGqczRIq6kdv+aKQMHFUKKuWgCy+qCFBIY1o/gqMdx1
 vL1i5CJksMdtwv5B4VgD1NmTdqujMhMwScrEr/Id7+FYW4L3buchA4JbW/BPxKhh1g1O6Aanj+Y
 a7Pxhh5+rZnlZLSYe8dPKke8T2D1i3kElJ3zKRfBheALhsU00lomnd1gvAh5dJckEOe9U6s5/Gs
 OSuS3D4wezEwtCYIoHMgXI2ogUMwKyaRUA7px4YnQ2BgH88Q5FwQOYrKaYCYbdEibVwTGJO9N7F
 kCD2uCBgbln8yHaNQVrJcXNXKMxzIx/BRje0wX4CUjShHNDvVgOw074kDa7y0omFp/q0GRDnB5u
 wLuw==
X-Received: by 2002:a05:600c:3b29:b0:47a:8bfa:bd5 with SMTP id
 5b1f17b1804b1-480541f9e3cmr11110495e9.8.1769213052988; 
 Fri, 23 Jan 2026 16:04:12 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:1430:8b48:2d45:6c1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e716b6sm10359890f8f.27.2026.01.23.16.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 16:04:12 -0800 (PST)
Date: Sat, 24 Jan 2026 02:04:09 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260124000409.36nsxlvkde4zpddk@skbuf>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS,
 BASE-X, and inband goodies
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 0A5527B944
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:13:26AM +0000, Russell King (Oracle) wrote:
> According to patchwork, this doesn't apply to net-next. That's odd,
> it was generated on last night's net next, and although there has been
> further work, it rebases cleanly on top of this morning's. How can
> these changes:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> which happened in net-next overnight result in this change in patch 1:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> failing to apply?
> 
> No, patchwork is clearly wrong.

Conflicts with commit dc6597fab3e3 ("net: stmmac: dwmac-imx: keep
preamble before sfd on i.MX8MP"), merged in the meantime.

In include/linux/stmmac.h (your commit "net: stmmac: add stmmac core
serdes support" adds a "struct phy;" line, but that other commit
modifies the context by inserting:

#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)

(the last stmmac flag in your context, at patch generation time, was:
#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
