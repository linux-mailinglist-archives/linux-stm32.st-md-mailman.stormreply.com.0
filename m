Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E663F73B7E4
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 14:45:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 936BAC65E42;
	Fri, 23 Jun 2023 12:45:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CF8EC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 12:45:08 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6686708c986so430938b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687524307; x=1690116307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2sk22LSjhy08WjBidsivSikrImU390NZZ49H7BXVoJQ=;
 b=dgy9ZZ/B/vzCfojJVvZFlMcbLu3U6AgURT7rc5FqQVNQ1ELPMyoJgnhNKdbnnSvKHw
 4ed/xa08bzusVTq2xsiDkJz8HAbslFeisfotHSzb6BROJQgM8Lhk3T/hvBq8jzvYlKcq
 27lIJ13qyy2Q+8VUVrDZwzgW44vlG4VhrBgv3yIyS9GDwH/KFZdjU9yBQyC0r6Nsa2xm
 GZa6mWGhu9Wi7yv1VnipgVBE9u3228i3fyfJeTHBRpxcYLyyjjef2luCa/bWKz+X2kSd
 En6B81JiqQtZmTiVcTuYkZdw7Ht1YzZDb4TjLongLYNkUAgS7hNxC5LOKFlNfYrA9/I2
 IrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687524307; x=1690116307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sk22LSjhy08WjBidsivSikrImU390NZZ49H7BXVoJQ=;
 b=RUDsqi/GbsEildcYZi+mk2Yxf7QV6uyTKrz4YBlWETTCHb7X3GolBPsANeri/ZS1Jn
 tpXB1DEie870CnJ8nj6W5/SrWtkusX058tse9QKjv3a8Ic1NFXbEqXnsDbQaxbqkvhtA
 KgleUkDNEVgm7PIKxlGZI0gKqeccxESn8PgwWsY6q4d9r6szJL9zWM8nWweEBk4Vvv7v
 gjUV8KbH7H1VugoeV4oNkN03ofFLZRnNW/gGqITB8APLxvoaYS4kt7t5LiAZ9TuTQRGJ
 LAKfhGQkj9vLhRb+IFliABcu8HYKyFzPR4wccK7L1bllGLTORczLFhEFPUVysAXVTbtW
 oGIw==
X-Gm-Message-State: AC+VfDy8W+oIQrXbLJNCSYP79ObS11yoAFU7hyAmL9RJV3Iq36alAx7L
 YuGj0vDN1J3mbOFM++yTh1s=
X-Google-Smtp-Source: ACHHUZ6yh1r1E1jdJMamk8/pwcIqXZFbn5z9Z4TX1FSYCK9sWTPK/gmdJAqZ5PY9Qy0QovhJWcDbvw==
X-Received: by 2002:a05:6a20:54aa:b0:112:2843:b546 with SMTP id
 i42-20020a056a2054aa00b001122843b546mr26730950pzk.58.1687524306826; 
 Fri, 23 Jun 2023 05:45:06 -0700 (PDT)
Received: from VkUbuntu ([150.117.130.6]) by smtp.gmail.com with ESMTPSA id
 y20-20020a1709027c9400b001b53c8659fesm7120300pll.30.2023.06.23.05.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 05:45:06 -0700 (PDT)
Date: Fri, 23 Jun 2023 20:44:54 +0800
From: Wong Vee Khee <veekhee@gmail.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZJWTxiJA4Z028/2G@VkUbuntu>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
 <20230622041905.629430-2-yong.liang.choong@linux.intel.com>
 <0652c9c8-27ee-0af9-9aa8-a2909142d405@redhat.com>
 <1599dd7a-f297-577b-7f5c-295a660c0c9c@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599dd7a-f297-577b-7f5c-295a660c0c9c@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tee Min <tee.min.tan@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] platform/x86:
 intel_pmc_core: Add IPC mailbox accessor function and add SoC register
 access
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

On Fri, Jun 23, 2023 at 01:52:49PM +0800, Choong Yong Liang wrote:
> Hi Hans,
> 
> I will discuss it with David but currently he is on vacation. It might take
> some time to get the final output. Thank you.
>

Please remember not to top post on ML.

Regards,
 Vee Khee
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
