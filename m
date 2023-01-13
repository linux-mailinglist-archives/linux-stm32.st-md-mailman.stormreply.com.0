Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BD669683
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 13:11:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86CECC65E45;
	Fri, 13 Jan 2023 12:11:47 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20BF2C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 12:11:46 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id vm8so51860782ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IPJSg4Zmt3zIF1jwOF51a0Egys8yUgt0jOK5/EupfkE=;
 b=VLl1Ajn3MlZ5ERaYDB9LRWELgbetfSa8z1cxnG+wb5ES3bSr8Oub8ar8TjffBkcnjd
 MPx4leKbJLxCP0nvqdApzLNwIjLPC1MNfKcdLJ1ymJwNAutaU0xhlZ2PlIjgNJFCIwtl
 ll/6kCs0rrM1ilkogyOnQC5598ZeVCDZveFxUaRkZSYgCrCCFLL+yA7nzjmU69NwQYUW
 Vi6W7BjsYUc/VC4xwm5ktFTQqd9dvlE7ESM79mZnxkN2bVp/z7c2bU/psjVuZZ7i3viq
 y1klB9hmZ7o3aSGUYJpdgF/gSBaKQBjEewMGbuaHRt6Rziq3wUpmnuM50TpbRu0u9g/V
 BG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IPJSg4Zmt3zIF1jwOF51a0Egys8yUgt0jOK5/EupfkE=;
 b=uvXAj9m6qZdU71MhfLXPyu1GtVfxmAXsekfq24q8o/W4ui8gCV2qksOhQpRmQzaaAW
 mBiEmA+gcKvHPoNHHwGR0XFcUiOxeyvaGdn5fjWk968K1yULwTiVOffoIffmPfxUsGUL
 WSRf8vTkHDKszQVJBXC5wLtVEW26FP2NDB9Gq3RubXWAyGTCzlYDEjxIcEDDlnnAxsCd
 5FU3Csamc0EBFv49S1WVfiTvcZUdMloTG0CWxiYOl2xvtfHlnCiOKKDdPem3qfw4A4yj
 t1m6/uMSliI1IGnvjGyBng2dqWqvEszL8YZEcxeYcOELZLnGEY6MqOmjNYRwW2lsfVVJ
 eJuQ==
X-Gm-Message-State: AFqh2kq1WkkbFEObL8BwuKLiueDM7AJGuFIJjMZpGdqOd/mCK+eUN7RZ
 gzOJfuWoH7PhXvdmpQTSagdd5g==
X-Google-Smtp-Source: AMrXdXtTnYm2ahDtT2Fc3hNhQJ2Qbn2zsMBf/+9ai6bmBO+J8tlWVPudhisWuV6WiUGeiR1xTosMCA==
X-Received: by 2002:a17:906:5dad:b0:7c0:dfba:54d3 with SMTP id
 n13-20020a1709065dad00b007c0dfba54d3mr11022747ejv.20.1673611905595; 
 Fri, 13 Jan 2023 04:11:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a1709061c9200b007c1675d2626sm8592741ejh.96.2023.01.13.04.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 04:11:44 -0800 (PST)
Message-ID: <435a6047-834c-ef3d-9aac-8bafa5e322ff@linaro.org>
Date: Fri, 13 Jan 2023 13:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Clark Wang <xiaoning.wang@nxp.com>, wei.fang@nxp.com,
 shenwei.wang@nxp.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
 <20230113033347.264135-4-xiaoning.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113033347.264135-4-xiaoning.wang@nxp.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 3/7] dt-bindings: net: fec: add mx93
	description
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

On 13/01/2023 04:33, Clark Wang wrote:
> Add mx93 compatible string for fec driver.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> New patch added in V2 for FEC
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
