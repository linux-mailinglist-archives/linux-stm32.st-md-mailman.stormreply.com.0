Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A826E2B93
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 23:15:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABCF7C6907A;
	Fri, 14 Apr 2023 21:15:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7EDDC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 21:15:30 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id ud9so48629046ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681506930; x=1684098930;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VUauNqUH8SviMCLNAJv5IYrg5F5Bu+FptiwoslQ+xFI=;
 b=u/PGfiDBOFJUjYl65eSqzMszDrdR8JFXGwqrpwriYGiTMhJcF0P45hDrI2cGYRhfmW
 JRb8WrMvFl7r0IpWl3IJygjQnhvk8iHDUVUyVuBPeegSvyKBeOPZGvBvXZECWYzWAz4f
 oqqWu7sv34M+xIHqF/IVb0LlDcp1Ia6sENPOXnzmL9TCp8zb9NFQTjBFx2yXyRwUgDmg
 TwQ/djrb9Uav+Ye621lSVehiWCo3u8Rc/KEeMP8ZUb0W7vSxLD1DpPiNHqgK6NKYOdK3
 VG/UV+RsOz0y24RfW3STKPklYzSakSz9e7ROnyXGY5ku9XG5qti7D58H9SEb+Sthp72v
 OT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681506930; x=1684098930;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUauNqUH8SviMCLNAJv5IYrg5F5Bu+FptiwoslQ+xFI=;
 b=QyWfSivQJj2VX/oCuCpwl0l4KFdhC+782+rvfy4W3ZXwcpgxC5x8+fnAfSzCEfy9OV
 kEmeLYszjdR5JSCuiIRJyqny6xV6KmzVHwIWNCrMUeEU+r+BQIs3OwCiKfF/Y8T2/Pik
 DC18ySU7CL0ZIeqvogai+HdO6fy3H3GndR73FVe5N2VUP4xm7C3/miqmyftt+H685y2K
 VjaH8Gv4pD49SlhcepPfVdj5jAb16TWYXgroPEJfuTvYuBT0vWYTTOJ0jg+kJzgJpMfy
 FhMusPgk6fmpiOPc8hRotVohDjzdFEYGAAMgk/OAaGoyM3axnw3SPVGH/1dBf9d6hZUM
 FsFg==
X-Gm-Message-State: AAQBX9eWrw2K0/WPwmHcMEgepMBHQbV5vSRJ39M+M01As1XE/WCRp2fi
 8hzGWRIW6zlc+o6fMuwGclJB0Q==
X-Google-Smtp-Source: AKy350YlQjI78vTkasGK6ZSDTKkQK+7zwh4Z1p8TbImh92gDODRqJJmS+18XluAV/XwAwn2lo8kYYg==
X-Received: by 2002:a17:906:5e02:b0:94a:6966:7b45 with SMTP id
 n2-20020a1709065e0200b0094a69667b45mr621291eju.39.1681506930157; 
 Fri, 14 Apr 2023 14:15:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688?
 ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
 by smtp.gmail.com with ESMTPSA id
 wv13-20020a170907080d00b0094ee21fe943sm1354903ejb.116.2023.04.14.14.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 14:15:29 -0700 (PDT)
Message-ID: <add2ccfa-d811-d76b-342f-a2204f7e87b0@linaro.org>
Date: Fri, 14 Apr 2023 23:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, hminas@synopsys.com,
 gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com
References: <20230414084137.1050487-1-fabrice.gasnier@foss.st.com>
 <20230414084137.1050487-3-fabrice.gasnier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414084137.1050487-3-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: usb: dwc2: add utmi
	optional clock
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

On 14/04/2023 10:41, Fabrice Gasnier wrote:
> utmi clock is typically provided by PHY output. Add this optional clock,
> as the core could use other clocks depending on the SoC where it's used.
> This is needed on stm32mp15, when using the integrated full-speed PHY.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
