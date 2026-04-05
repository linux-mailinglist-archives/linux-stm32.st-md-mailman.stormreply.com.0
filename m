Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFFOJye80mnGaAcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 05 Apr 2026 21:46:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640C39F989
	for <lists+linux-stm32@lfdr.de>; Sun, 05 Apr 2026 21:46:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15F45C87ECE;
	Sun,  5 Apr 2026 19:40:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63FC3C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Apr 2026 19:40:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 090844454F;
 Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AA8C116C6;
 Sun,  5 Apr 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775418039;
 bh=F6qst3LBccqfafD86O3ZKGJti3SyNgdle+pCAPtzzro=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YHHUdqlvUxvqgbqpHgiHnOJxb/bBwCTy+Ye+xBX4NLO67OqGfmJilzzO37Xi+Dk35
 FHELVBf4Ck80uqRyeWe020nsBrRGMkn/B8IAfc63ZqfPBJkz6q02PB28eBNxcMLRqC
 r+xZAWg8UXHoWJnqFlGIeQTGB2CBDNakP4i331W4Uwk8zXKaCorpIJ0PW6KpnEIB2Q
 FWUggyW2SZpi4oW3rY9EVn9YSsSsgI+1cMheIJbPKwnk6Gn19Ly/nJk8RDcZoICbQX
 Tz0KheAsRVfWnYiPCKMMHwYuEpZ4kwTDCTJj2Tw7wAYz8HFujZVjIBZBlFTwoC5GTT
 LbwInDF4FQo7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun,  5 Apr 2026 14:40:19 -0500
Message-ID: <177541802158.2061229.7249314871905290258.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [Linux-stm32] (subset) [PATCH 1/2] clk: qcom: Constify
	qcom_cc_driver_data
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,oss.qualcomm.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.663];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 4640C39F989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 11:17:22 +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: Constify list of critical CBCR registers
      commit: 87df31ea43eef5f6b9e7be0fa2555e58a9455e05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
