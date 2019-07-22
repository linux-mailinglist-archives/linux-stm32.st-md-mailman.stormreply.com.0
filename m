Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92A6FE99
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 13:18:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CA00CCB330;
	Mon, 22 Jul 2019 11:17:59 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB421CCB322
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 11:12:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p74so34706737wme.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 04:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugRN07ELNBGju0FZXfeTINwMh3Eu6S1IN6qjdKCIFBE=;
 b=gFpS54Ax3j5KsNqU6isZdGlE+UrqmTn1H7kDrcDfPtz5MDBUHiilO+ZhfhdUYaCeeU
 rnEF6ZKsuR9+Iv9LsEGoAaEVzSJuQ9SY3MRzFskJQjMVNJtpIQo5TVJC2A470Fnv5WKA
 Kkwh4Qvq5M8KWeAHKby9Ab4DdLCxK9kvQlmG+LVcXjze03oJ9l16KEKk7AfepwwSlUmB
 4PCxmpKH72WnymNl5ig50UJfK/N7j5HIxINywTZieue+9SYmx5xcD735gsjHwAFt1cX0
 5yC2/bv/9IG7OT2uIPZuVOkzW+kwc0AoBZclZ7h01TmKpUOxv2kH86Bx5WGN7FOca3nn
 oKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugRN07ELNBGju0FZXfeTINwMh3Eu6S1IN6qjdKCIFBE=;
 b=tQ7DeSKpCX8NTw/9SuL/PULOrpJZK9No7XcTmDeqrjrDjEoOmOPwK9Qvsz0CLuOQsO
 W9WRFa7zDgXl89AtRDEOgSZdztdylH/ORKQcj3vq6WrrlrQ0xfV/XmXo7NIdOMTsyg2S
 r26kyiBfWMIe2SlsIEsK+uAe4ITRQBzl+F+j2h0hXfDStwUOCrvJJ3YhMTwOvReYVZQy
 MFB5qEwBRP5SDSLGpELZiKoF1/tw+ubzxnqHpxL/maK8h7wG6gNBLtDk1A42zV3wfC4w
 X+L/UXKMq2SL+9F49XqT3nPklnXpcCn9fGpSox5LY9PyuTFxOxC1FBWBIQnYy4xGJPkC
 Zvgw==
X-Gm-Message-State: APjAAAVADjLBr83y9kbRwDXU2JKx2/ua0dvbU8JKAfqjOAxvj5OzW4kV
 ZJ6LhtSlWKhIvNJkoo5Ya7VHo5DEn9WojyV9IZY=
X-Google-Smtp-Source: APXvYqyMOVi1QeBfQY7y3XFV+dCnJfmPmLUDhkHjFCy6dBRz6GZNepCI13S7cLN1oIlGT7gkQSUn4ppFimfg0qTYAS4=
X-Received: by 2002:a05:600c:24a:: with SMTP id
 10mr64703351wmj.7.1563793921410; 
 Mon, 22 Jul 2019 04:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
In-Reply-To: <20190722101830.GA24948@apalos>
From: Lars Persson <lists@bofh.nu>
Date: Mon, 22 Jul 2019 13:11:50 +0200
Message-ID: <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:17:57 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
	support for Page Pool
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

On Mon, Jul 22, 2019 at 12:18 PM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> On Thu, Jul 18, 2019 at 07:48:04AM +0000, Jose Abreu wrote:
> > From: Jon Hunter <jonathanh@nvidia.com>
> > Date: Jul/17/2019, 19:58:53 (UTC+00:00)
> >
> > > Let me know if you have any thoughts.
> >
> > Can you try attached patch ?
> >
>
> The log says  someone calls panic() right?
> Can we trye and figure were that happens during the stmmac init phase?
>

The reason for the panic is hidden in this one line of the kernel logs:
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

The init process is killed by SIGSEGV (signal 11 = 0xb).

I would suggest you look for data corruption bugs in the RX path. If
the code is fetched from the NFS mount then a corrupt RX buffer can
trigger a crash in userspace.

/Lars
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
