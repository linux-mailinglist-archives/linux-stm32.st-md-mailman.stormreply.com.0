Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D9969682
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 10:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F963C7801F;
	Tue,  3 Sep 2024 08:06:50 +0000 (UTC)
Received: from mail.pr-group.ru (mail.pr-group.ru [178.18.215.3])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E64FBC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=metrotek.ru; s=mail;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:
 in-reply-to:references;
 bh=sjR6z0zfk1JV9KzZ89G1lCI6RwR/rJTW1RdNkW2xf6M=;
 b=FnSQ/EHiJLwLjt2SBq39i2QdpN1mZw426pSEb0bTrAkH20ATaxvNBc0+tNssrmUZqeiYRBqPeG0gl
 yPMiSVceClRh/rbTzTdjFG8e7ZPloJOThOzYo3MQ1YVJglumvNF3zeTIWMQ8VQU8fcP5bkHGdSqeZs
 1Djgklg3p+VC1Jd9ZjpWPqz5OtXWnm2yx3ks1RIZ6QuBVjcdtKDHGcMCKUID9qd5IRsG+BhC0wO60A
 abD67QYa1Dvyo9XyJiZujvHMwBa125aE0CTGwQ+sn4si+zFsvm91sGGTS39dGEPrLg4fFLO9rgMLfX
 pEjA5ADvx5BcHIRSqFP5id+kMum1tSA==
X-Kerio-Anti-Spam: Build: [Engines: 2.18.2.1544, Stamp: 3], Multi: [Enabled,
 t: (0.000009,0.003730)], BW: [Enabled, t: (0.000024,0.000001)], RTDA:
 [Enabled, t: (0.089953), Hit: No, Details: v2.79.0;
 Id: 15.krszj.1i6cmkcba.2vpck; mclb], total: 0(700)
X-Spam-Status: No, hits=0.0 required=4.0
 tests=KERIO_ANTI_SPAM: -0.000, BAYES_00: -1.665, URIBL_BLOCKED: 0.001,
 CUSTOM_RULE_FROM: ALLOW, TOTAL_SCORE: -1.664,autolearn=ham
X-Spam-Level: 
X-Footer: bWV0cm90ZWsucnU=
Received: from fort.ddg ([85.143.252.66])
 (authenticated user d.dolenko@metrotek.ru)
 by mail.pr-group.ru with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Wed, 28 Aug 2024 17:35:57 +0300
From: Dmitry Dolenko <d.dolenko@metrotek.ru>
To: ahalaney@redhat.com
Date: Wed, 28 Aug 2024 17:35:41 +0300
Message-Id: <20240828143541.254436-1-d.dolenko@metrotek.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429-stmmac-no-ethtool-begin-v1-1-04c629c1c142@redhat.com>
References: <20240429-stmmac-no-ethtool-begin-v1-1-04c629c1c142@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Sep 2024 08:06:49 +0000
Cc: system@metrotek.ru, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, quic_abchauha@quicinc.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, quic_scheluve@quicinc.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Dmitry Dolenko <d.dolenko@metrotek.ru>
Subject: Re: [Linux-stm32] [PATCH RFC/RFT net-next] net: stmmac: drop the
	ethtool begin() callback
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

Are there any updates on this topic?

We are faced with the fact that we can not read or change settings of
interface while it is down, and came up with the same solution for this
problem.

I do not know if Reviewed-by and Tested-by are suitable for patch marked as
RFC but I will post mine in case it is acceptable here.

Reviewed-by: Dmitry Dolenko <d.dolenko@metrotek.ru>
Tested-by: Dmitry Dolenko <d.dolenko@metrotek.ru>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
