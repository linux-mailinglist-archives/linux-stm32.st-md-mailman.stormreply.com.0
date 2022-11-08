Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74639622463
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 08:05:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F04C6504B;
	Wed,  9 Nov 2022 07:05:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF532C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 01:28:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 571A861374;
 Tue,  8 Nov 2022 01:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7079C433D6;
 Tue,  8 Nov 2022 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667870882;
 bh=1tioVGTqeYyNu4ZTUF3M9dc/z4ZQURezc3VWaBrCJto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HLP8jD4QSSThJkjIQqil670uZQL9WbPDEr21hUQAUPO6Ev2oEun0a7lim21s8npHR
 igtf95QL+xKdej8gH48zv7UFEe4Omr53qX+r5QzySHttXqmxr5oR44BrSke/9UcGmY
 C1DK50OKAyLqkSpH8wgwcYGimsbunpvTJdHZTHjCwgya/YuqQk9srl5QQ62LBnPuxL
 Ek3aReGKzUyqhBj167FFI67amFiXD7W842l0A5YVdTOuR5775ZRz3KfMcoO+om8YKP
 1KvJgTSVk7idZ/POhz5Nf/M8i2L7hHO1z+xFvhOPRqaT4zmfe51sZCsbgBjrJgTvYh
 mvabAFPzjp9HA==
From: Bjorn Andersson <andersson@kernel.org>
To: marex@denx.de,
	linux-arm-kernel@lists.infradead.org
Date: Mon,  7 Nov 2022 19:27:32 -0600
Message-Id: <166787084676.599230.2324624555833358061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
References: <20221013221242.218808-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Nov 2022 07:05:30 +0000
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-mmc@vger.kernel.org, linus.walleij@linaro.org,
 konrad.dybcio@somainline.org, agross@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH v2 1/3] dt-bindings: mmc: arm,
	pl18x: Document interrupt-names is ignored
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

On Fri, 14 Oct 2022 00:12:40 +0200, Marek Vasut wrote:
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
> 
> 

Applied, thanks!

[2/3] ARM: dts: qcom: Drop MMCI interrupt-names
      commit: 2f7fa366bac9aa2addb83ffa5f208291f4dbe4d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
