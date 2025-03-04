Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C67A4DA75
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 11:29:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F7F2C7803A;
	Tue,  4 Mar 2025 10:29:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C811CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 10:29:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D67E5C49BD;
 Tue,  4 Mar 2025 10:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A307AC4CEE5;
 Tue,  4 Mar 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741084158;
 bh=EplWlSoRJA83AmlqX8c2hMFGp2dhjVihkkYBWa3OdiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pCEw2nDVmaMxddk+m0CxK9txDxc76pc+CXngQjvGIXPsu0HykeXtCHepJ6nX9feIX
 HKFp+zbC3ngQmgzo2RAbfhObvVm+KSGUal7pEeGi/hTkg44iiNaF90pfa4lIKS3x6o
 Qvv0rxoRcAfLjQraZH4FMzphDqWSBACDQ6AULldtUPt69f+9gV7aeP+3fhHZsYsS2h
 c6NDfUovmdiz1WiidYCZqJX/3OcC4dMtOix2g19bY8lLJUzGVYCTHEX7VW+ia8uRW+
 JTA+GJ3zSWBKsQQ4UrA8ekhsTQF1nLIgFUqjXDZl4SoNAY7OPAqXNudJCEdAeF8hVF
 /NmyTeDsE7c5A==
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue,  4 Mar 2025 19:28:42 +0900
Message-ID: <174108402893.227977.9200776572329997415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224170657.3368236-1-fabrice.gasnier@foss.st.com>
References: <20250224170657.3368236-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=wbg@kernel.org;
 h=from:subject:message-id; bh=voCn1RjNuoiczOEdMALQZ3vX+Eb+fDa/WmXmEaBSPz8=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOnHru6brC/xqmPi2tDZG2b0cfjqJiZluXM5y1dI3N1vp
 uKiV7Kro5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZjIqkmMDCear2b9vbU4Ikb1
 hO1OrsO/Xhd1LJvO3pB5sfEPz+94s4eMDG9Osugv4eVMn6adcZt1R4JAkaitr2HlzADdaZnVCh4
 eXAA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix error
	handling when enabling
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


On Mon, 24 Feb 2025 18:06:57 +0100, Fabrice Gasnier wrote:
> In case the stm32_lptim_set_enable_state() fails to update CMP and ARR,
> a timeout error is raised, by regmap_read_poll_timeout. It may happen,
> when the lptimer runs on a slow clock, and the clock is gated only
> few times during the polling.
> 
> Badly, when this happen, STM32_LPTIM_ENABLE in CR register has been set.
> So the 'enable' state in sysfs wrongly lies on the counter being
> correctly enabled, due to CR is read as one in stm32_lptim_is_enabled().
> 
> [...]

Applied, thanks!

[1/1] counter: stm32-lptimer-cnt: fix error handling when enabling
      commit: 8744dcd4fc7800de2eb9369410470bb2930d4c14

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
