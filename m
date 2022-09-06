Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C15ADDD4
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 05:15:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7621CC640F0;
	Tue,  6 Sep 2022 03:15:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B78C0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 03:15:33 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 123so665351pfy.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 20:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=2Cv4J+G1ogeuhW2nYiMPfNrTRhf6xVCDkRcJYgEDOdo=;
 b=RPxZo+YsQb6XwjGWPcxzjVJSos/O53ZGOILrimS02m6F670i9ysff+OX6eOjWZqUKF
 kB9qKf3w2fGJ/6EBg+fogISllEmQ5S9DuNQ2ZQlYxvlRtaMKC3lsFb4qk2XCNkQcAR7f
 pZTesvWgOQbM29Me0oakWTpptZHxRYEHV4CbODiBdIKAQPIuIy34VW2C8v1sd+64gKWt
 YPvkBXlesFL2qPJdCzprNYsEAcdY23L9noBBPJemNg71shyh9VSzsS++SJdtDjHZ4O2V
 ZyfXPxJiA1WhANM2OjAYmL7Agwz6aC3cd+9RobBU/QJG/cMVB0+TLJD9UIFj+jg3Hq32
 8dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2Cv4J+G1ogeuhW2nYiMPfNrTRhf6xVCDkRcJYgEDOdo=;
 b=1mHTysWuH9bEfZCCp79hTtXHYjqwJx9F1i4wWOEAQgh9sjJ+Kavvc+EFaUtdl2gW8H
 SECdEyxzAK6mVD7pu+0lqPKVQF62jgsMFScO1Ew39Flwi635Ewsumz186Adum8MBfSe8
 JRzCivKVytySx2WPj1uvSrtpfm0kvtU9qikPEeE1VABfWB/XuL+LL3BIjsj7wt6YZ3Su
 rOI4FY5fgBvcQJZmCDMu5TS7l4U9OMAB995Fy12jC+2Eu/wO4SDBBPwr35Y9eqnCcZEE
 CFllT8d/QSxSY0MWbmHkkT7HyA6wQYgNF7G5Wtr48YjqbHU4WRXV25PmMn+J/rdUvBcB
 i5KQ==
X-Gm-Message-State: ACgBeo1Ja2uR4mGW2m2cZMsuxYllkxSnGWxl+tsgo2UmF7RHEJNmj7p1
 m+HKhOtKUDqxxoLZdFacRdg=
X-Google-Smtp-Source: AA6agR59Zl9XsjGYaA4xg8qC96Keihi4AwL8NlIKwkoOLV6Y1fdv9933OpmqptlzVYdQqPnKnvvWfw==
X-Received: by 2002:aa7:8b44:0:b0:537:a35d:3c11 with SMTP id
 i4-20020aa78b44000000b00537a35d3c11mr52527144pfd.76.1662434132005; 
 Mon, 05 Sep 2022 20:15:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a635251000000b0041d628dde58sm7303516pgl.30.2022.09.05.20.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 20:15:31 -0700 (PDT)
Date: Mon, 5 Sep 2022 20:15:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <Yxa7UCcheX5M/XKY@google.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-6-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712163345.445811-6-francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] dt-bindings: input: touchscreen:
 stmpe: Remove node name requirement
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

On Tue, Jul 12, 2022 at 06:33:45PM +0200, Francesco Dolcini wrote:
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
