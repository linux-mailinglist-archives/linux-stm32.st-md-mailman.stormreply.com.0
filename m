Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A7BC84D9
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Oct 2025 11:28:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33A00C36B24;
	Thu,  9 Oct 2025 09:28:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9294C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760002104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=;
 b=I/mejTVLwyHu4siBdvmC3pX+l5zwJg1Juufmb/ysGHQEaXOFS894y3fqj8fM8IPkOZr1Vc
 49PzrYZxrHPNzP1BlQvT00mGR03GYZbYXf8ekvdBIqu0+d3xa2STtiAvgLr1TC1XZs4BAO
 Z0dh4fW7Ga5WNBeRvDCbqHqT+oPKDa4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-7io_mc1SO9WgpSEs6aFmug-1; Thu, 09 Oct 2025 05:28:23 -0400
X-MC-Unique: 7io_mc1SO9WgpSEs6aFmug-1
X-Mimecast-MFC-AGG-ID: 7io_mc1SO9WgpSEs6aFmug_1760002102
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e38bd6680so5321015e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Oct 2025 02:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760002102; x=1760606902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=;
 b=eObo46xYIl12nlFkjxfSlNk+UY2W47lY92siv3y/hJ6MyKeThzRHoh18o+0IIHsZw+
 X8mc1b6qYzjrymjbnc2VflYzA4HfyBk5i9NuINGMqaPUwyRU0nhnUrTiaAfeffuvz54D
 yJUDZ01ACoNXH2p/NnCR8i9jnygc5PS/VarJLZZTCtDzbAdk2QmmtkcctSwfR2C1SeH9
 SnfcP5AJRf+QGl4PQ9VZst/hZr8o6AFx+07vVnW3ZvdnFYSqVKtZo3exdy3zaAiN9nQv
 wXA6ZFf2rWreGETseobT4iKQmlXm3/ARG2rBhwWUcRylOCsIVIkP7F6XoGljTXEgBId2
 oprQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuFfihUvE2PylhIvaErOSzp2v0nc6NKzs20VYPIYOtHbtmEhvcqc6ACdvwfUmHso4lsIsrzMfQDaO6kw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8hJlIEKfgPwKL3EuDKa3H8qf/u6aqhwPgdTv5hXmFZQMPllmq
 4pSlCDMPjx+6yIzPqE0siQU96YrjQUL2gPaWi3HUasir2EuxWLZMlA2sGp/qouaZRWeoqBxRJ8h
 a1/gIXEgb4Vnp+lI7IeGlR+DFXelGcEZ+32zN1dM1FRuOv0kvhaIEG6OPBJ3XBmdHkE5hMQuZcs
 l6cN/4JA==
X-Gm-Gg: ASbGnctoFywS59qPcpbHlwe9B9LjYHiWvFOY9U9sbvlg8I17mc1AzZmY86Zv8q8TGaC
 nq8hJrPe/Fxw0WWE7WruomiOZIFOfd83ZtcF+Ih9H4FCmDcgzq9P+57K07N3vQVdI8OfgVEKL70
 lTMLWqswoZOQh2fpDrMMkQAMLEH+BlKglGEV3b9bNhjnh16A6bp9xAWJUg6GVFb3iTVJCBMM7B4
 z/PgB0yACqRs4A3XjOuqLCYyp0xtVawedmvzknwk8ZH+b0tZ3eUzj0YgKjQkGRI2wwo4oWAn5pB
 m/jmS2XuFN5mupuzlE9jumwiTG3QZLY3AXCKmIPqL/+4cij6wfMeICrrPIRes5NCQOrISDRpy0B
 b+AkBG0x7l/bFw4lxPg==
X-Received: by 2002:a05:600c:4e01:b0:46e:6a6a:5cec with SMTP id
 5b1f17b1804b1-46fa9a8e5e9mr45746435e9.2.1760002101722; 
 Thu, 09 Oct 2025 02:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY3/Xon/8eow6YV6te1PVIUeQNsTPhTN4xL/Kc6c75ZTtzIKnnqNPMPgFzo3E/3FgK5+ApKg==
X-Received: by 2002:a05:600c:4e01:b0:46e:6a6a:5cec with SMTP id
 5b1f17b1804b1-46fa9a8e5e9mr45746105e9.2.1760002101274; 
 Thu, 09 Oct 2025 02:28:21 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c?
 ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d7f91esm75339585e9.20.2025.10.09.02.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:28:20 -0700 (PDT)
Message-ID: <3184d938-5100-43f8-93e8-f88549ea4b72@redhat.com>
Date: Thu, 9 Oct 2025 11:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Usjab0uKIJbrkqeYLXKIz7L3AA-nn9VBLvLGAeA0soY_1760002102
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/8] net: stmmac: qcom-ethqos: add
 support for SCMI power domains
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

On 10/8/25 10:17 AM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Fix the power-domains property in DT bindings
> - Rework the DT bindings example
> - Drop the DTS patch, it will go upstream separately
> - Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

## Form letter - net-next-closed

The merge window for v6.18 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after October 12th.

RFC patches sent for review only are obviously welcome at any time.
---
Also please specify the target tree in the subj prefix ('net-next') when
re-posting and possibly additionally CC Russell King for awareness,
since he is doing a lot of work on stmmac.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
