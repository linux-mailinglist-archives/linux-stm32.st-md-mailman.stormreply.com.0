Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCABC458D73
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Nov 2021 12:30:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85872C5C82A;
	Mon, 22 Nov 2021 11:30:08 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E09B7C597BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 11:30:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2B53120CDF9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 03:30:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2B53120CDF9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1637580606;
 bh=Gc95weIGGpO+jXyf82d/fH9Q/HcQ7XjvTMwfhsgPgI4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OI4ZWxsym+mw7hYk8A2um8Y/M/Iwse97wugDiCCxlFnyfQcsFtsRLS1z2D5hW+Vkx
 ZvfKh0GEahgx9z15FD8Kg/9y2H4v0Bskj8nYnCPjrsBuE9e+z7e9DR/nE4/0Liwy/Y
 7PUedmA1zE8iO5LF/8jCK7UhzX+cPqFhS+dLlt0w=
Received: by mail-pf1-f180.google.com with SMTP id n85so15772399pfd.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 03:30:06 -0800 (PST)
X-Gm-Message-State: AOAM531HB4Fke+jvNuUAtnK8maIpQ1YXJ38uBb1bnXAtIxfHh4qFMyj7
 GVg/80DzoOABTh3BNPOvWqadMW1xI1RL8i7/IoU=
X-Google-Smtp-Source: ABdhPJxSTevhDOzsZ28L/0ODxidwCGCcz7z3raqHwmrHB2ue0L4viG8Xnag+6PfN/t0C11BGDPcCuvS4O41ETSmLU0s=
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr42597291pfm.86.1637580605680; Mon, 22
 Nov 2021 03:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211122111931.135135-1-kurt@linutronix.de>
In-Reply-To: <20211122111931.135135-1-kurt@linutronix.de>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Mon, 22 Nov 2021 12:29:29 +0100
X-Gmail-Original-Message-ID: <CAFnufp2U8Dv3yJiw+uPGOiYXxdNspmvsJ0rWKicvXTi4R32tdQ@mail.gmail.com>
Message-ID: <CAFnufp2U8Dv3yJiw+uPGOiYXxdNspmvsJ0rWKicvXTi4R32tdQ@mail.gmail.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Benedikt Spranger <b.spranger@linutronix.de>,
 Voon Weifeng <weifeng.voon@intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Caclucate CDC
	error only once
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

On Mon, Nov 22, 2021 at 12:19 PM Kurt Kanzenbach <kurt@linutronix.de> wrote:
>
> The clock domain crossing error (CDC) is calculated at every fetch of Tx or Rx
> timestamps. It includes a division. Especially on arm32 based systems it is
> expensive. It also requires two conditionals in the hotpath.
>
> Add a compensation value cache to struct plat_stmmacenet_data and subtract it
> unconditionally in the RX/TX functions which spares the conditionals.
>
> The value is initialized to 0 and if supported calculated in the PTP
> initialization code.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---

Nit: "Caclucate" in the subject

-- 
per aspera ad upstream
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
