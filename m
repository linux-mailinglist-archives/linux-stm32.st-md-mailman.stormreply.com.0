Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B2CEFA9D
	for <lists+linux-stm32@lfdr.de>; Sat, 03 Jan 2026 05:34:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B301C8F260;
	Sat,  3 Jan 2026 04:34:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E744C87EDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Jan 2026 04:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 277184194A;
 Sat,  3 Jan 2026 04:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0CFC113D0;
 Sat,  3 Jan 2026 04:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767414871;
 bh=p4A87N5ftzlH7YFKC1X2sdFtN5r6pL2CEkpBHwe3nWc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FoFAWFv0lY+JVohu01zqcCw8tuwA1uHc05+YrtEMK13FmWN09mrTGtnGwBcFoUY9Z
 OD1SD1GxaH84HSesyeIvKXu8qF9R3gqoaTyc4kFECH8n7SfmgJGRTgJ0VlE7QY+MUL
 gcVEvSZvtsqsEH8zLPlndtmFrIYrvxi3Y2wcqOTO+XShu+VaUZPd4e8hpBfT47Bs4a
 cgulWgrF8Q6ar3V2V/W+0AY5LgjOiPjtk+UjyIEz6unA9J9NcMJIBY+4blcBN+lNVn
 J3HBE+5EtTDrSeGpzYjm/GaALsoQY11LPmZgZi8ov+Li8lpwtKXTZyU3sLJs5JwAng
 k7JjYLrX7fG5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri,  2 Jan 2026 22:34:26 -0600
Message-ID: <176741484218.2558240.11360428266466272086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [Linux-stm32] (subset) [PATCH 1/2] bus: qcom-ebi2: Simplify
	with scoped for each OF child loop
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


On Fri, 02 Jan 2026 13:50:31 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
      commit: 9c252f3c8f390fae4ca09de36c9262a35ae88ace

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
