Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED6441424
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 08:27:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325C7C5A4FF;
	Mon,  1 Nov 2021 07:27:32 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E46D8C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 07:27:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s1so61386731edd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 00:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QX73/TVtR5W8m/Vq63b5sJhbliBL72ushPOHfy32+cA=;
 b=n6uFN6SpgKEONNUQYWEMk3QSatL2VU+3OIE365rTDm3tiXT6C2SFl9eNPrjpy0n3yf
 bliXoXmfekvp/fwai3s73qeJy8IQNtaYnhX+a+inMSkk4CCcz0YxxFCRlzA5+MhkDloB
 mZCJ6uYgoAAq2W5aLVj+kH/vSE0icEdQobOlrM3q2LpTF6FPxXqI/uaEdopabkkIRMiV
 c4Gd0f5Mr9fTyrmp9yJF+RHZsAwJalbWM4IGPMOsZNgN/aokE9a7IQyVQD4bjD8Fn7sU
 eSvVqs4C7lPKTyFbRxDeFwI1TDcIa1lN1CNrPFDSvkmSBHGQKd1pzR+0TkhLgY3dr1SG
 /1vQ==
X-Gm-Message-State: AOAM53127xnwLmJxepZg8IpwKx4ljFoTpJxPEzbyGQdJ+mct3rVH3kWp
 /YIq2LVKseHJNCzyJi9WX7c=
X-Google-Smtp-Source: ABdhPJz67dOV3GnCoSUWOvabzexqGXdP8guxumkAaVgH9YZqCSQCmsiydaI/dW9/wtOJPyA45DiFiw==
X-Received: by 2002:a17:906:4e54:: with SMTP id
 g20mr31002753ejw.284.1635751648035; 
 Mon, 01 Nov 2021 00:27:28 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id w1sm1854315edd.49.2021.11.01.00.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 00:27:27 -0700 (PDT)
Message-ID: <0b42eede-d909-1afb-f3fc-c4ee1e2fc0f4@kernel.org>
Date: Mon, 1 Nov 2021 08:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
Cc: linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v10 0/2] Add rpmsg tty driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 15. 10. 21, 11:46, Arnaud Pouliquen wrote:
...
>   drivers/rpmsg/rpmsg_core.c       |  21 +++
>   drivers/rpmsg/rpmsg_internal.h   |   2 +
>   drivers/rpmsg/virtio_rpmsg_bus.c |  10 ++
>   drivers/tty/Kconfig              |  12 ++
>   drivers/tty/Makefile             |   1 +
>   drivers/tty/rpmsg_tty.c          | 274 +++++++++++++++++++++++++++++++
>   include/linux/rpmsg.h            |  10 ++

Hi,

care to add an entry to MAINTAINERS too?

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
