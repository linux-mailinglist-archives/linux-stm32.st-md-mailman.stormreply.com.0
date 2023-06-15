Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F510731A1F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 15:36:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C480AC65E58;
	Thu, 15 Jun 2023 13:36:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DEE2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 13:36:19 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-977c8423dccso164628166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686836179; x=1689428179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NxhJfd2ll8nAFEQrVCzLMvEn8Jp9xjM7Kxtgv+YXz0k=;
 b=dsjqIHaT5wS4DUA/yheEW/2GYzurEmgUgIdHq8/vnYdTrOHAuOM5AodlutyPp2pYRJ
 L7WPq+XRdmZm+UUmGW728WTZtYZNBCJnUrTz4XR2sQq+h/myyiPXeBMI18MhZlfyPnpG
 Y0Ja9e0CPdydOd+P1qtJ2CYne6/7V+ddBVCuWqJ1N5IFdAENJ6MvG5NSPSM4HBcpUgTH
 ylPIm1TV3B+SArtmR0ttkf/wzafizoa9pOtEDljmAYnlKzH5aLQD88yY0BnS7m6auj9h
 V+iG+8YD7YpbdxhfDMX58LzUmPeXtbSu4ytX2Or+cxFPY0nB9ccu5RQsMckZpf7lYy+t
 zNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836179; x=1689428179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NxhJfd2ll8nAFEQrVCzLMvEn8Jp9xjM7Kxtgv+YXz0k=;
 b=OyOjhGGhCkeMQWNmr5jMUiPTaSMK0/T5lI3iZocHpX28lhxznGRqKM+Emhwkf5pZ83
 il4d+gTlmr7ypJ3UhheYvtuegtq1+KB3tRZ/jAmNeKkMTcmjAgdhMwvJeUozYwuT92bS
 csI6jWVmyNFO/GcG0qvK298PCyPzWJValBfTsoUR8GsIQdkozyjOfsxfj9UyyXCsM6X9
 zgh11gX00GOsyOExDYCyqE50rog3pvK1uH1dSq7GG52K1arQ6k75QJcIXC3f2fKSFyrk
 gtjYb7UylPmMjCKIOskp2G/hfdcO6hXbF9LHNIsiNuLwBtFnYPiQKg1H7CV9Hl22Y/N6
 GX2g==
X-Gm-Message-State: AC+VfDw3Kj8IgMXPKOU07+0XmzBSbrmUOcYn09dgj+gIlzb3OGJHIUVE
 OvZd0v5cM1MpRGyI8JAI9f2ZOg==
X-Google-Smtp-Source: ACHHUZ5G2KDVI97s5jDk0HjvRJ8KLjMmTYTO6401STaAZBen4SFHRcAjha9stATuA+Qbd4ZYA9sCEw==
X-Received: by 2002:a17:907:948a:b0:978:9235:d450 with SMTP id
 dm10-20020a170907948a00b009789235d450mr5096371ejc.9.1686836178947; 
 Thu, 15 Jun 2023 06:36:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a1709064acd00b009787ad3157bsm9470074ejt.39.2023.06.15.06.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 06:36:18 -0700 (PDT)
Message-ID: <479bf05e-342d-f94b-87f3-4cc0a95fb01a@linaro.org>
Date: Thu, 15 Jun 2023 15:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Valentin Caron <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20230615075815.310261-1-valentin.caron@foss.st.com>
 <20230615075815.310261-4-valentin.caron@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615075815.310261-4-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] dt-bindings: spi: stm32: disable
 spi-slave property for stm32f4-f7
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

On 15/06/2023 09:58, Valentin Caron wrote:
> From: Alain Volmat <alain.volmat@foss.st.com>
> 
> STM32F4 and STM32F7 can't switch to spi device mode.
> Forbid this property with compatible "st,stm32f4-spi".

Just to clarify - driver cannot switch or hardware does not support it?

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. (spi: dt-bindings:)

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
