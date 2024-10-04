Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EA991344
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2024 01:45:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C1EFC7802B;
	Fri,  4 Oct 2024 23:45:51 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0E00C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 23:45:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5389e24a4d1so3304272e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2024 16:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728085543; x=1728690343;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kKcY6x98VwBIZfuYWE0CTgk1MQhMRRZsUKeLS0TDxsM=;
 b=eTyjxgbk5zCWlZko8NcALO/uyizWA/tBUvZYN1tx+94OhcRxsWjw5JXu5JlANrdK/7
 mvvnI2VTNQSJ6KfTIMP3Lpuu+ljCxpSc3ZNOrsZ2gp5AaXOmqV/7flPcbVMrpo1PO8s+
 W0LTZ9qfferjuIZOjWZK70pFfmvNbZVanXVVF3mb/unOvHXnapqDapNGNOEQzbLIy3L0
 4ph4JzTLtg2ThRJ36r7uZX5AhrX+ICumlfGSQplsZarp0zLXxhnhIAblY2xDY5SUi3Dp
 MDtTIxUzFfxqCwThopa400zLVTrujIDQFGS0FOqYkc0ybaFU0SNIC0AnM/BS4tGt3c5P
 yx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728085543; x=1728690343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKcY6x98VwBIZfuYWE0CTgk1MQhMRRZsUKeLS0TDxsM=;
 b=azdfmB3Q4AZ1BOKo6fl6a/QotpICfAkRPSb4JStQnEU+Pb5UiceF/WHTfWSL7wurWC
 En4Z3prPkjuajOcLrF+zl363wp734c0lA/D0nRL7p+XDnUbf0mirUamSkloK7yb+6JMY
 t/M1MSt9JrERJf5Ucxn1WPukDIOoNMEXGOqHDXXs8gOP/cubLMHyF7miW+tlMb2EqtUB
 Cl7trqVsXFw799NcYYNHvZp5l6Dhlet46QdPVz3C3H6hQcK8Ymj6gd8kgPU3sk+THDsV
 oAnEoj0Z1JGgz9BsV2R6Uyl+ZeHAlmZnFF7I8TfEIzvRM8tHlj/Ovh9SL5umOgb4YgQ6
 pZ2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+x7z8uAsn5XgayqLD3+2fvp0RY91+ly6dfvNLFBz0QLNg9RNS4iqmpRbMEohTDXtpfEodWXrM0u53ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVF7hboUKIyZMTXUvrsnTIQ2hESE5fDBCVTH2BOaU7MwHGQzks
 bEq/tYTMjM9Os6j6EcHBTKWvF609viVIlXVx8UN/r0+fzV7aIaJT
X-Google-Smtp-Source: AGHT+IE2/OgCUxjr2/KKwuTZKAbji33Fn0uKCa1pwUQ9KxL72/DlYPR5DFLQKq2bl+asGEq37rYhoA==
X-Received: by 2002:a05:6512:68d:b0:539:9064:9d04 with SMTP id
 2adb3069b0e04-539ab873f77mr2528871e87.33.1728085542646; 
 Fri, 04 Oct 2024 16:45:42 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d152sm84080e87.149.2024.10.04.16.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 16:45:41 -0700 (PDT)
Date: Sat, 5 Oct 2024 02:45:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <js6s2vwcpqlykbmeqwp4c6ikmb5ctfz6klzxob3qao2mybboox@sz3s3f7qdv57>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
 <20240904054815.1341712-3-jitendra.vegiraju@broadcom.com>
 <mhfssgiv7unjlpve45rznyzr72llvchcwzk4f7obnvp5edijqc@ilmxqr5gaktb>
 <CAMdnO-+CcCAezDXLwTe7fEZPQH6_B1zLD2g1J6uWiKi12vOxzg@mail.gmail.com>
 <CAMdnO-JZ2crBaOEtvgMupQs7nTZ8r0_7TTQdX3B3n6F_owAMZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-JZ2crBaOEtvgMupQs7nTZ8r0_7TTQdX3B3n6F_owAMZA@mail.gmail.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/5] net: stmmac: Add basic
 dw25gmac support in stmmac core
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

Hi Jitendra

On Fri, Oct 04, 2024 at 09:05:36AM GMT, Jitendra Vegiraju wrote:

> 
> When you get a chance, I would like to get your input on the approach we need
> to take to incrementally add dw25gmac support.
> 

Sorry for the delay with response. I've been quite busy lately. I'll
get back to this patch set review early next week and give you my
thoughts regarding all your questions.

-Serge(y)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
