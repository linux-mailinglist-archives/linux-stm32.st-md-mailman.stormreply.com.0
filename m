Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CAB2BAF5
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 09:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F319C3F943;
	Tue, 19 Aug 2025 07:42:26 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5411C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 14:46:03 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c5Frn1Pqlz9sbW;
 Mon, 18 Aug 2025 16:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755528361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prisHkZFsumBlISEjbp86v+p5Me4Xe1CO3z5hU1zoUg=;
 b=CWUCt99WERkMWk6G4EDiKPbKhhUHoWRRiDS6bNYPIA48IbBh7ljN7V+MRXGONqDOmm8iWs
 va+rGc/LuOiHIKMkLLdfC/GC/tPGrqihjB+S8IIUGfk+pbzQ8l99vHzXmXsBDz+LpGtr1o
 4t417sis4XnbF+XsS6JyespaleWdP1K6U96upKz60zufD21H0/S5J+Ztg+Ox6XxnCv/ewk
 YKK5EluLM1TqY3eHojWBsXUW9dqOC5+EB4OvAx3aoOnJ5fj2RIHOvYT+TPVZmkvI0Khi8v
 bl4YSjppcx+xz+l5OtXLlodJ9nfi5JeuHtAN1mDS+hOGNH3/AhxZ9tMNd69Pig==
Message-ID: <388e6f81-383b-4b39-9b75-8d2cdbf95d37@mailbox.org>
Date: Mon, 18 Aug 2025 16:45:57 +0200
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
References: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
X-MBO-RS-META: coqxxm9yzunxshdnea793g9zi1nidobq
X-MBO-RS-ID: 7fe8b2a187d2927442a
X-Mailman-Approved-At: Tue, 19 Aug 2025 07:42:25 +0000
Subject: Re: [Linux-stm32] [PATCH] arm: dts: stm32: Drop redundant
	status=okay
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 8/18/25 4:37 PM, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default, so remove confusing or duplicated
> enabling of few nodes.  No practical impact, verified with dtx_diff.
I assume the "no practical impact" means DTs are identical before/after 
this patch ? If yes,

Reviewed-by: Marek Vasut <marek.vasut@mailbox.org>

Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
