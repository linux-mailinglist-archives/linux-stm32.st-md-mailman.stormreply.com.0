Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B20567F82
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jul 2022 09:06:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DFCFC03FDB;
	Wed,  6 Jul 2022 07:06:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2E23C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 07:06:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id c15so17335267ljr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Jul 2022 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bz6Q6Fa1YPetlBznSCPVIVUyt5DE98y2dZImsjK2Yv8=;
 b=tvIqGHClygD44BkugbMwanSv/36LJecwYVa+DSFyov6VN0U3qfLZb3nu87e6Esx1Gr
 HRaLCL0bxhrc63Fsrwteu3cgA2d5YNbLdQqXdieLgMp1oBHVNuErVcpXEl0ai83XBfnF
 K3NGU1lYCNjfweUXSoc04dJHls6JmxY4zO+4jBoMu5Scc7WL+8t9jL4Aa513JH/J5vpT
 EdoP7jq0kknSNbF86js20S1NhRPHZpn34l4Ja/MXmartLTQRlLDFjSGORA5MwWpmS3g1
 BHRsaj3TDoDhuTeW0APz491J1XYBKI6dguTvE8Drf3MxaEE0wXk1ag7aWi04d7/xWr1u
 iHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bz6Q6Fa1YPetlBznSCPVIVUyt5DE98y2dZImsjK2Yv8=;
 b=Wf+q8J/uvONomcAdQMHOaQYRaXrWKU4cOuhO+hz8APGVfxxPIf88ToJn505urzbP/g
 WOHLsbi+y6yQqq4UUONN16fZC7nEbimcrblfSjIv0F97tLuI3IB6Vh/nZ/fYv6igcW2w
 rEl0lb0x/ciSJm0PCSlLl7CF82PtoiQN5s7jo5m8dPP2uT0XQvH6bG+duIFSK5DUYLVC
 +T8bfl5xwskQDCa27qvoRTLfPGVQJe8SMFbP3wR16sKIXzgcP1R1g/mKqdz9YOSH9oxq
 lPNkL78GKdY4Ag8zmDtGUDeyLZVKir89UY9Y/1rhgm4KnuR5Jm/VZIReDVwirMD9pvGV
 0whg==
X-Gm-Message-State: AJIora9QYEFzIpD/HOU83hPeGNz1QcgU5C+YpVZt0rZFrf4lvpMXk9Sy
 DoAdb4BCvkkE/EDb6L50h5YQtg==
X-Google-Smtp-Source: AGRyM1usm4O5Yb3o6i6Cn0wioXtQfAUgzfnG2UsRxbcZnwyO45UOmIaUEy5e/hW+wuLQ6mMtvCgPDg==
X-Received: by 2002:a2e:984e:0:b0:25a:9fd7:c6d3 with SMTP id
 e14-20020a2e984e000000b0025a9fd7c6d3mr21762666ljj.66.1657091175181; 
 Wed, 06 Jul 2022 00:06:15 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e150f000000b0025a89f36accsm5970693ljd.42.2022.07.06.00.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 00:06:14 -0700 (PDT)
Message-ID: <3d23244e-d926-ad9c-68b6-50ac8b4fd752@linaro.org>
Date: Wed, 6 Jul 2022 09:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, robh+dt@kernel.org
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-2-fabrice.gasnier@foss.st.com>
 <ddb0e946-c955-1404-c1cd-c2548f34ec35@linaro.org>
 <845d6817-d2e4-7925-f7f5-da1102514636@foss.st.com>
 <286633b2-43d2-655e-b3f1-54bf5c7a4a21@linaro.org>
 <6ef58f1f-ee8a-b060-6fda-d1388b3ede6d@foss.st.com>
 <f86dd47c-0fc5-6c93-a49e-534610d10c49@linaro.org>
 <dfad8fb5-6205-d620-81eb-5d44b9175e05@foss.st.com>
 <0821acfe-bcfe-b1d8-c1a9-81023f4ab6a0@linaro.org>
 <13266b3e-7571-23fa-13bd-1c8107a5f90d@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <13266b3e-7571-23fa-13bd-1c8107a5f90d@foss.st.com>
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: usb: typec: add bindings
 for stm32g0 controller
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

On 04/07/2022 11:08, Fabrice Gasnier wrote:
> On 7/4/22 09:55, Krzysztof Kozlowski wrote:
>> On 01/07/2022 12:04, Fabrice Gasnier wrote:
>>>
>>> Then I no longer get this warning upon build. But the dtbs_check complains:
>>> ---
>>> connector: ports: 'port@0' is a required property
>>> 	From schema: ..
>>> Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>
>>> So It looks like to me there's something missing to handle the single
>>> port case in usb-connector.yaml, when using the "ports".
>>>
>>> Maybe usb-connector could be updated to handle "port" (w/o unit-addr) ?
>>
>> Not really, the dtc warning looks false-positive. Especially that you
>> need port@1 for USB 3.0 (super speed), unless you do not support it?
> 
> Hi Krzysztof,
> 
> Having USB2.0 High speed port only is perfectly valid. port@1 is
> optional to support USB3.0 as you mention.
> 
> I've no opinion regarding a possible false positive warning. I'd like to
> sort this out, perhaps Rob has some recommendation regarding this ?

I would propose to skip the DTC warning and stick to the schema with
only one port@0.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
