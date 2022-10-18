Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C62466020A2
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Oct 2022 03:55:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A692C64104;
	Tue, 18 Oct 2022 01:55:41 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7C57C640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 01:55:39 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id j21so7845000qkk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 18:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dt3s4L6WuN24AfP3E/RhLtFLakK8K9lR0cO6Rs5M7mM=;
 b=eb0O+PgFkBTi7L6kqMTJRH4F7rpAVsgQnXX/yCtmuncA2cmZz2prCyw9Ni8iu6O+Kr
 DNy4A587z7/afs9UMert4Iy9gBRFazJ/2p7wSUehkA5uXTkirx2W2BPYmaHP+ulm/48+
 7gW7PGvliK36Z3fDobFHLjyPYtrGlStXbbyKJYJPcunUlNRShhMJh1tTOIku/KstPedY
 /kf9EGmgGslMjFghzDiabJEGxh/ao0c3RPUL8hDvqFOYfNvHWq4YBSzfuz303zGdJjjq
 uDmpGoRPyfYMQ205Zp7+oWd7Ax3PSltf7wFoMcEFpft/sRmTV9Z4YZJFsqwMw6LSI5yq
 956A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dt3s4L6WuN24AfP3E/RhLtFLakK8K9lR0cO6Rs5M7mM=;
 b=1nVHSmSygBsMD0HwxapaWwVusHQe/Xa8cyxtM2a5qj3YA7LkIXdw7vUl4A8xoYKDPj
 nbdZ87J27Y1aym+ykqkQEXQ3+tvHMhvqJ+1yPyE+EUHh4w4BJ3QbJ6sUzTJaUzSs9N8Q
 3oFyCNqtsor29pXpltZ+c5ckLSpMkrLW9jV99jz5Jixy7+FRaxO9GRzb2y8VX433JrXg
 sZSY/hXQndVR/360BZQX38SHzmBmffzDpQzVTIbbjjMtMjXUMjhWm3dZtWPpKXLK3qZe
 rAEM2yOZ76FK/0t2fS840Aj/yHCN08dYpH9LU8b+9i9MIhR6pX33aTOKksq33yfELxO3
 XY/g==
X-Gm-Message-State: ACrzQf18h/Ipy5mn7w3oJlSBl7d5uiaMWRVuAHHW/fK7+Y6ZKT4gazqA
 D3ezuy4okQTcYc5CAv7aLPd4zg==
X-Google-Smtp-Source: AMsMyM7g9mG/Ju4RyQrOyke7A1ODg1jEXPOIkeWW/ymskM+A2CttCliDmq7Do0jYHcQOck9l7UVhEg==
X-Received: by 2002:a05:620a:25c8:b0:6ae:2408:6e9a with SMTP id
 y8-20020a05620a25c800b006ae24086e9amr391427qko.222.1666058138924; 
 Mon, 17 Oct 2022 18:55:38 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 s3-20020a05620a29c300b006d1d8fdea8asm1275226qkp.85.2022.10.17.18.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 18:55:38 -0700 (PDT)
Message-ID: <c33c5490-c43d-17d5-f0fb-0b930dd46928@linaro.org>
Date: Mon, 17 Oct 2022 21:55:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221017134437.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017134437.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp13: fix compatible for
	BSEC
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

On 17/10/2022 07:44, Patrick Delaunay wrote:
> Use the new compatible for stm32mp13 support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> This device tree modification depends on the binding modification
> introduced by the patch:
> 
> dt-bindings: nvmem: add new stm32mp13 compatible for stm32-romem
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid/

This breaks users of DTS. The patch above did not describe devices as
compatible and that's the problem sending patches separately, without
context.

You need to keep compatible.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
