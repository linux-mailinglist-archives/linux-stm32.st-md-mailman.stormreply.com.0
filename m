Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7F7AAC78
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 10:20:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65BB2C6C82F;
	Fri, 22 Sep 2023 08:20:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 981C5C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 08:20:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38M8KQbI116649;
 Fri, 22 Sep 2023 03:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1695370826;
 bh=/DzZEktjO9kVfpnI+exRh6b65njwoqhvk7patX0JxOQ=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=PG4sI2rrFNS07SPKQBQLdr96Afazkm9Aj0K/tRyDmGkb/Qywl3mEoMVLX/gou8Dlv
 eT2WQmkEzE49Gwm5ysJbQjOyJpiksbHNmwpMSi4ps5kYuMBkeaeaPQb9jiuyRQQoML
 TEia62ATg6DWn4/xjv0Caf+C+GdzQunNLvRLqyZ8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38M8KQhn030656
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Sep 2023 03:20:26 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Sep 2023 03:20:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Sep 2023 03:20:26 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38M8KPUa118745;
 Fri, 22 Sep 2023 03:20:26 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Olivia Mackall
 <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20230921080301.253563-10-gatien.chevallier@foss.st.com>
References: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
 <20230921080301.253563-10-gatien.chevallier@foss.st.com>
Date: Fri, 22 Sep 2023 13:50:25 +0530
Message-ID: <8734z6hb5i.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [EXTERNAL] [PATCH v3 9/9] ARM: dts: stm32: add
 RNG node for STM32MP13x platforms
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

Gatien Chevallier <gatien.chevallier@foss.st.com> writes:

> The RNG on STM32MP13 offers upgrades like customization of its
> configuration and the conditional reset.
>
> The hardware RNG should be managed in the secure world for but it
> is supported on Linux. Therefore, is it not default enabled.
Just curious, will there be concurrent access? If yes, how do you manage
the entropy in that case?

If you allow access to RNG from normal world, can attacker change the
setting to generate more predicatable numbers leading this to secure
world as well.

I understand that you're leaving the enablement part to customer but
you still have to allow RNG access to normal world for that.

-Kamlesh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
