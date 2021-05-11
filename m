Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597537A711
	for <lists+linux-stm32@lfdr.de>; Tue, 11 May 2021 14:50:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDD4DC58D5F;
	Tue, 11 May 2021 12:50:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F4E5C57B5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 May 2021 12:50:04 +0000 (UTC)
Received: from mail-vk1-f199.google.com ([209.85.221.199])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lgRps-0003fd-B4
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 11 May 2021 12:50:04 +0000
Received: by mail-vk1-f199.google.com with SMTP id
 x19-20020a0561221193b02901ead4626284so2411444vkn.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 May 2021 05:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3CHScK0w/i5BRJ15ikgMVAxlFb6izuOHy9b40Y6y9vo=;
 b=qx3FSpwKNe7TmcBNdFi8B7+N6E2/dFWx1z3rO2UFo2mwG8ce2A2ciSlMgqGHEqsF+v
 rzknd8AKhGtRaqfKoJFVn7YZNw6zFtogmkI/3VtFcJAHbnTe4Fwii2TUuSkqLlDCj6ug
 6qe+YXTr/zTzoIFhlSRaL/v8RW7DVrM0RCvvLHUUdMLX89pZzibLTNexn2yDzuK5TuhO
 8ApNFqm0SpWyUCBLsN1p94QIVU4rq5s76mD+7KeR/4ySZceocqmAyYn+BZFmNm/OlW0v
 vQnSTTqIE/v3+z/eNF7YEnBaxtR25iOE9fTyDH+ac0B8wmG1X98ufY7v0QBB9/pQ3d84
 Tjxw==
X-Gm-Message-State: AOAM5320RI7PGpgiIE6BgD75UsZdH3IILWtsHuvGozkMg2l7iqGKoUfO
 vkGarh8soH3xTTybdbX3NWFzkb2OTuUCkTQk1GyoL0Drv/7tvelwnap59Ygt56WJrpBlx0aLvyZ
 GpyKi4djDJOj2CCUa1d/hPSAfJa3pjYJauhQD/5aeIggAoJMQd9PjxHfTOg==
X-Received: by 2002:a67:bc19:: with SMTP id t25mr25273950vsn.47.1620737403464; 
 Tue, 11 May 2021 05:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFyE9m8eV4zf4aEFSPxqmMKcHRhOhyNthNh2rU/fKLb6yhq3wMSKshAYjkfs7OpwF11Pw/2A==
X-Received: by 2002:a67:bc19:: with SMTP id t25mr25273930vsn.47.1620737403336; 
 Tue, 11 May 2021 05:50:03 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
 by smtp.gmail.com with ESMTPSA id d25sm2162175vsh.5.2021.05.11.05.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 05:50:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Date: Tue, 11 May 2021 08:49:58 -0400
Message-Id: <162073739433.14559.11646873146475181222.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
References: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Subject: Re: [Linux-stm32] [PATCH 1/2] memory: stm32-fmc2-ebi: add missing
	of_node_put for loop iteration
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

On Fri, 23 Apr 2021 12:18:14 +0200, Krzysztof Kozlowski wrote:
> Early exits from for_each_available_child_of_node() should decrement the
> node reference counter.  Reported by Coccinelle:
> 
>   drivers/memory/stm32-fmc2-ebi.c:1046:1-33: WARNING:
>     Function "for_each_available_child_of_node" should have of_node_put() before return around line 1051.

Applied, thanks!

[1/2] memory: stm32-fmc2-ebi: add missing of_node_put for loop iteration
      commit: 2f9dc6a357ff3b82c1e54d29fb5d52b8d4a0c587
[2/2] memory: atmel-ebi: add missing of_node_put for loop iteration
      commit: 907c5bbb514a4676160e79764522fff56ce3448e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
