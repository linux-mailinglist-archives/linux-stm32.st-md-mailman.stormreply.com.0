Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHEBAmRpg2kbmgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 16:44:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91407E9427
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 16:44:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13271C87ECB;
	Wed,  4 Feb 2026 15:44:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EECFBC87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 15:44:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9209F443E9;
 Wed,  4 Feb 2026 15:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86463C4AF09;
 Wed,  4 Feb 2026 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770219872;
 bh=+SiVY+/yNC7rLAU4MsNDlaFmt/l6M3hSIaCT9ls3sWA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ChyBoGK2yE6SGuM1Drf5M172SdoJACKZFUrrNsUyxs9tGn1I7qqhqJE3n0SdMuKH8
 WBsiwmPVq8rOQ6GO0hIm6TfZIkR7fNFOFSnqJ6Wdc5I/3L23nQxD+pLZgfso/lsmdU
 N1ft/ntOh+AHs/UCG+Km7aago4ldSONLc+3r2AOXwQZfUcNSU1niG9vFP8cVLMaEBv
 VG4YKOSwN1dDXgyUhW0x6meOz/fA8+ehA5Aie8KkSz3fTjfCixIQW19ESOaqSx9ox7
 M5PMr/5rexa0xvN6NnkgCdEKKhyKZgRD5vul5MiJBcLirTLb81zxgj6ptueMw8TKGG
 fD9D5P7F7CkxQ==
From: Vinod Koul <vkoul@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Message-Id: <177021986017.133434.7084660742419779164.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 21:14:20 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen Wang <unicorn_wang@outlook.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Orson Zhai <orsonzhai@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-sunxi@lists.linux.dev,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Simona Vetter <simona@ffwll.ch>, Jacky Huang <ychuang3@nuvoton.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, sophgo@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, freedreno@lists.freedesktop.org,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] (subset) [PATCH 00/27] clk: remove deprecated API
 divider_round_rate() and friends
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:alexandre.belloni@bootlin.com,m:baolin.wang@linux.alibaba.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:schung@nuvoton.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-clk@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:unicorn_wang@outlook.com,m:jernej.skrabec@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:orsonzhai@gmail.com,m:keguang.zhang@gmail.com,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:simona@ffwll.ch,m:ychuang3@nuvoton.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-actions@lists.infradead.org,m:mripard@kernel.org,m:vz@mleia.com,m:sophgo@lists.linux.dev,m:abhinav.kumar@linux.dev,m:robin.clark@oss.qualcomm.com,m:wens@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:sean@poorly.run,m:neil.armstrong@linar
 o.org,m:lumag@kernel.org,m:sugaya.taichi@socionext.com,m:inochiama@gmail.com,m:andersson@kernel.org,m:linux-mips@vger.kernel.org,m:jesszhan0024@gmail.com,m:mcoquelin.stm32@gmail.com,m:orito.takao@socionext.com,m:freedreno@lists.freedesktop.org,m:afaerber@suse.de,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:keguangzhang@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.alibaba.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,nuvoton.com,somainline.org,gmail.com,sholland.org,outlook.com,st-md-mailman.stormreply.com,lists.linux.dev,timesys.com,ffwll.ch,kernel.org,mleia.com,linux.dev,oss.qualcomm.com,amd.com,poorly.run,linaro.org,socionext.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 91407E9427
X-Rspamd-Action: no action


On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied, thanks!

[25/27] phy: ti: phy-j721e-wiz: convert from divider_round_rate() to divider_determine_rate()
        commit: dbeea86fecef7cf2b93aded4525d74f6277376ef

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
