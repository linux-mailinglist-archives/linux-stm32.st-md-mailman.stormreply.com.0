Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F6150614
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 13:23:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 780B6C36B0C;
	Mon,  3 Feb 2020 12:23:58 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 201B6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 12:23:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so17841255wru.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2020 04:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3v/Vs0yeJ3ecKwEer6nb6dCD848+syrgOhZ1MgNf01o=;
 b=OQjszmdeF1avb9z4L8TI3nAzsDMNuMML1awwJiBVgnYx6iI7YimVGjVFAF3F4HCzyz
 x1iv+Dzc/Fe7OtSbRyRIktw0AmkfSfMon/QDs3xKEGk/U0yqABjy3FmWrMARlz3M2nVR
 RMuWtJMEk5HJNpNari14zqmoXtySlA81bN963epuSJz50EnPh+zWnssUtufSQsdhCYCr
 05H4cKZJv18/NVvUFXKsFdzht3vWpM9cz2oeT02JjxucwEvf0BG7QPR4gPW/bk1yto8E
 M/NpIN78s98Iuy5A2N4f4cPLqc9WMIAjS13cwqYbVITYsqU7u3GtV6ubhBBCdFNgKH8a
 eaHw==
X-Gm-Message-State: APjAAAWiGLs4WodBaaoGkVe5DY6oGIJpOZHRFnkXffxVgJiK5UBlkXWt
 dOodR8irC4latHBQ5GLjFg==
X-Google-Smtp-Source: APXvYqzm7oTIsPC2zqv1FVF4iP/x1vKYv6xy17lG21/YsbaWyAoqw9qpdPt25TTkhLOPw4zWj+CrZQ==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr15162486wru.230.1580732635248; 
 Mon, 03 Feb 2020 04:23:55 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
 by smtp.gmail.com with ESMTPSA id n1sm25145622wrw.52.2020.02.03.04.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 04:23:54 -0800 (PST)
Received: (nullmailer pid 26802 invoked by uid 1000);
 Mon, 03 Feb 2020 12:23:52 -0000
Date: Mon, 3 Feb 2020 12:23:52 +0000
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200203122352.GA26745@bogus>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579795970-22319-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsa@the-dreams.de,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] dt-bindings: i2c: i2c-stm32f7: add st,
 stm32mp15-i2c compatible
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

On Thu, 23 Jan 2020 17:12:47 +0100, Alain Volmat wrote:
> Add a new stm32mp15 specific compatible to handle FastMode+
> registers which are different on the stm32mp15 compared
> to the stm32f7 or stm32h7.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
