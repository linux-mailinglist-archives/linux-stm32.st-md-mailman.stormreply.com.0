Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5293317B8
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 20:50:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB25EC57196;
	Mon,  8 Mar 2021 19:50:38 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A9EC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Mar 2021 19:50:36 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id c10so9950862ilo.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Mar 2021 11:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zUEHi9fxgr7OlK2hUQHkI4CDstdppVXLftwBvD8x+2w=;
 b=eyHN4pTU+TFsN6/s8ZKdjdCT2KwKxvT5q32k7FH08k804QthcFVmzxLqn17Q5NgqMA
 22d64LreiHzEjap3PsIYJRod9sHjCB9FizzFU/R1YNxq+NKpnZSP+dUBFOg61QSnQOYK
 Q0gjfMMA6TaGGuqWgoJYgjDX7kTYnwdxyj28MiMoLUkU7n1HFCpP5eNtWr/aNf4cj8S+
 Bvbf5jcmV43twwPe37xueTKJuWv+jRBLvoTCR+0r54qg0eABy3maIaYO9OoLDGW4eLEY
 +8tvMDFDdkxyVSSkH/flPFWtQLJJkpe5NW1lt905bWAGxrER/l3Drq6o4PxSk+wLFcM3
 OtzA==
X-Gm-Message-State: AOAM532Iy1DhDBOtMqFAmCz7ip2ahVyBWKMs7ORLEW5dP/sSDrtiJLy0
 OdaM3tv71FmHsEzakseTHA==
X-Google-Smtp-Source: ABdhPJyDCK/yigH+8lLp5Ixku9+13pgiKN+28WfUEXFwFFlcs9knPSnGHB9LxdR4qJJsuVFIWVuJQA==
X-Received: by 2002:a92:60a:: with SMTP id x10mr21704294ilg.262.1615233035599; 
 Mon, 08 Mar 2021 11:50:35 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q6sm6771545ilm.66.2021.03.08.11.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 11:50:34 -0800 (PST)
Received: (nullmailer pid 2855345 invoked by uid 1000);
 Mon, 08 Mar 2021 19:50:33 -0000
Date: Mon, 8 Mar 2021 12:50:33 -0700
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20210308195033.GA2855292@robh.at.kernel.org>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-5-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614758717-18223-5-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com,
 alexandre.torgue@st.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/8] dt-bindings: pinctrl: stm32: Add
	stm32h750 pinctrl
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

On Wed, 03 Mar 2021 16:05:13 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
