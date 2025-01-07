Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E258A03409
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 01:31:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E2D0C78013;
	Tue,  7 Jan 2025 00:31:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F37CC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 00:30:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF184A41FE7;
 Tue,  7 Jan 2025 00:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BFC4CED2;
 Tue,  7 Jan 2025 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736209856;
 bh=wDhSYOfboak3qK+hy1jYjiF2LpSH+HGBwrcDHRKoB60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hpl6zwgdR4rZ4/LVHS2TAzt0LK+XL1glv0sqbDQZP5vA/yFhfcJUM/eZMo6mBhJG5
 XyzVwBNReTSIVRdlVitJ1NShl44sdJ0tzFaKhuvroIL1z4OEWZ6V5iR9Qu0HlW7kNg
 6ymMwWmMG8LsBL81AQsCNwYMqgv9UXNZMC6TTPeSVj0YYaO61EtJEwaQk1aLAD9pa+
 7pEmZ69BMmznRpGThBIONnF1Y7/r40mDlKWDJJv/TMQiD8ons7ehNGNdLqmj44+dKj
 7upTyLTWkJ5nTVSqIm8ITzVHXzrR+oKncduJjAlNMaVm3wCqB72QGwqf0IodKWQjlS
 nFn5woCVD5o0w==
Date: Mon, 6 Jan 2025 16:30:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <20250106163054.79cdd533@kernel.org>
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/3] Add support for Nuvoton
	MA35D1 GMAC
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

On Fri,  3 Jan 2025 14:32:38 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

Would be good if you could reply to Christophe's question.

Then please rebase on top of net-next/main and repost.
The first patch doesn't currently apply cleanly.
Please leave out the second patch, it has to go via
the appropriate platform tree, rather than the networking
tree.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
