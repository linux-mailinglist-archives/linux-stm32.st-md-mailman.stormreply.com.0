Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 079465BEA1E
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 17:26:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4253C640F2;
	Tue, 20 Sep 2022 15:26:18 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF765C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 15:26:16 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id b24so3424523ljk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4l7aMfmqCryjQwAP7nUR3rR023wPhPFZ45uqdGA6vXU=;
 b=ug41M0juoWTyFjlJFI3JO/BxOIkOyJX1HmmPygZID/A2DnhJvRY/vpvmZ6zDKaoN/9
 0iVDpLlXaxIX34fhgBHkS0UgbP2o5Zt97FlJwookkZY45p4frVPv0qG7BPk2Awsn68VM
 00DNt0kp/ihgQi2peCOsZnd7seMCnVOyGujvrhehLXya/jMDPjvMCG7H4luP04o0/LKP
 UAOYwyc4vImp7vdyM17Ul+GmrEkDW6T9/anC236oZqGTSAfAB+0b7xtPmcpXgEdYKGF7
 XC6tXPY5gYECtmW51sXIvoEKcsBSnFO+u20x9LPS+xAtOAHyyMwueAqo14sEm/sPdmjG
 aSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4l7aMfmqCryjQwAP7nUR3rR023wPhPFZ45uqdGA6vXU=;
 b=qnXhqBM3re9UQSveyPp10Tr6mb+Xsg55J/hJIUCLHRPDsd6gMcbCuc2t9W2v7NIU5U
 /e8ext514GgCd/+UWAjE58RtLP2V517qSXP0yolDkdZU4hGPhqDtlHdyJXnSE82LQnMC
 /GgG+JBsmOA0OoQRJIIG/M71fKxMCPjLVK/zIASP2SzqfbfkfSUp3Jbl9ZnTcNmRwa/c
 ycesoCcq1WV7zFvl2KKmrkfcDAkQipOSIH8pMo3FTpVz9XCb7R1FtXP2Vc8wJuLIbUr9
 s01DHWXGix/0B46r4hFvcN06Ys+xbqKYGQX7RCT2MlFxEsFlDi7oD/3NGMTguSLU3JQq
 0dug==
X-Gm-Message-State: ACrzQf179KVeu7KTKNGea9EAGMp+zDd8y3uD0jZRZuQn4Zu4vy8d6h91
 s640O1XZWlK0dDnlw7ypa1ZNGw==
X-Google-Smtp-Source: AMsMyM4JKyvwhM7YiHyZtwVoNrtUcBKYR2S6GGTDusaMteI1RsYMqBPofBm3W7n40MgCMtIOk+opOg==
X-Received: by 2002:a2e:a549:0:b0:26c:4988:2742 with SMTP id
 e9-20020a2ea549000000b0026c49882742mr4206383ljn.11.1663687575964; 
 Tue, 20 Sep 2022 08:26:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 be17-20020a056512251100b0049a4862966fsm10743lfb.146.2022.09.20.08.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 08:26:15 -0700 (PDT)
Message-ID: <ada6ef7f-0106-6a30-64ad-66b3277d987b@linaro.org>
Date: Tue, 20 Sep 2022 17:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920083617.4177-2-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: net: mediatek-dwmac: add
 support for mt8188
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

On 20/09/2022 10:36, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>

Please version your patches. git format-patch can do it for you.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
