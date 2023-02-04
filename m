Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D368A766
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Feb 2023 02:00:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3581C6905A;
	Sat,  4 Feb 2023 01:00:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27462C65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Feb 2023 01:00:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id e6so6947272plg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Feb 2023 17:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DyRW2kRkALJvfbqyo707FmQ9B014BcAVIGtudI89BsI=;
 b=CS1bM11NDKSmGMg2bZmf7FAS0PGdMB29eY2ABsRjIUKdwOoMBiNGrwNcwobiebr0Tu
 Nay8pDaWLmSIbberHSjXfc8SUMU0fndN+WxcIYsc40eeP71i0jwdC6L2B88H9S3qnzKT
 U+vDvUFkN1DydA5rX9a7KTZJ7GX1skJG4Vd2mxPohqF5yTvrMTSGCgZYwptutkBGT0hO
 TOTFxGDhFz/4lvEwdvfOLVHFhgBdhT/5StZTwbz1Wn2t+rScrPvAgiSkV9gEF+ZlkPOU
 3vd9EljXIJQEVaRsnQgG2J09fR3/rBB2Szj4SYptakvyHFmYd9X8aYm/PF/X+TEDM0PW
 einw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DyRW2kRkALJvfbqyo707FmQ9B014BcAVIGtudI89BsI=;
 b=ZQ6v2BV59Z4KPLeQRI169Pa3QXqpttVgSQ79ySKaxwbrCCuIHOzCacNjrq24FaHGZM
 EApP5KrG1r2uQzZCCE87MEoCXsWb1qCec7yU8kBFmebexZny0DiCrZ61uOKT5xreLEnL
 Kn725KZ87VaMG/x0PsZiqy7RGrq1q6kmtVmXQYV/yHNTdqVmrFtlujpnvp8l1MMn5Ge9
 65SxsrVchMsSM8rGWEH3LlmzDxKkCpukqMNPPZ21Fv0zBOf2UaBkuFKWHXbS42xATNnw
 nAt/1F7ram5PFGDQyNGqOjT8v8K9cUhxxkloHMzN7Sz1ouvY/CFz5rcpAUmkIg07vZNl
 1JcA==
X-Gm-Message-State: AO0yUKUfGuLoovRCW0F1dXM77jVsYIVP85+YUGuWgvxt8TrwSSk+9l1Y
 sONStsFmuPRW79h59R1sqhw=
X-Google-Smtp-Source: AK7set8fH9kPxGyYsa4tZXLKYBOFk5JlRG9CIXqZzLKiuavsHGP6b1IpAD4E4Jyj1WoXB09wq2+MsQ==
X-Received: by 2002:a05:6a20:d38f:b0:bb:b22a:d7ae with SMTP id
 iq15-20020a056a20d38f00b000bbb22ad7aemr6340062pzb.2.1675472414260; 
 Fri, 03 Feb 2023 17:00:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5a16:81a3:86ec:ceb2])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a63b609000000b004e4ea77badcsm2042369pgf.80.2023.02.03.17.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 17:00:13 -0800 (PST)
Date: Fri, 3 Feb 2023 17:00:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Y92uGr0uxDWQ2ose@google.com>
References: <20230127202040.196411-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127202040.196411-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: input: touchscreen: st,
 stmfts: convert to dtschema
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

On Fri, Jan 27, 2023 at 09:20:40PM +0100, Krzysztof Kozlowski wrote:
> Convert the ST-Microelectronics FingerTip touchscreen controller
> bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
