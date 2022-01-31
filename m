Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C64A47A9
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jan 2022 14:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACC65C5EC43;
	Mon, 31 Jan 2022 13:00:03 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E19DFC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1643618455;
 x=1675154455;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=QUD3eX1gv6pf+SHUsL8xktGL7lcFYX+qYdueEvu2MHc=;
 b=jKwkeCKF/N0+3bUBJT0gMlL7O7FagFObCX4RbWh6jgC2oiLBrW1nkvL1
 JpuXBlNtmV93mhfHEFU6upy9SmiIv1KUUKP0KNUgWsn/ffAXCK3dj40xy
 3wcL25vwm3Rx4YirN6I+Ipd1m17pInJqsucTcRV1cifUbBaplDtXLrjcB
 7hi9M1YQm3xMucoRJ9tyiuX0orhLO9/P80lfh5skaVBafiS6Y/RP//QZ7
 gIQSfOFxLt49rHoKRAK+jafDWVWtVHySs3lMVq6fBoIrGZeKYaHmr79FQ
 VbfTWhCStpdtDHjmw2a9zYjciesNrWlJJ6DK9oSa/UCmjXi08BG8ZYdJD w==;
Message-ID: <732099cc-9f3f-d04f-89e4-caa2a6939677@axis.com>
Date: Mon, 31 Jan 2022 09:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Camel Guo <Camel.Guo@axis.com>
References: <20220128153642.3129922-1-camel.guo@axis.com>
 <20220128142955.047bd9d4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Camel Guo <camelg@axis.com>
In-Reply-To: <20220128142955.047bd9d4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail07w.axis.com (10.20.40.13) To se-mail03w.axis.com
 (10.20.40.9)
X-Mailman-Approved-At: Mon, 31 Jan 2022 13:00:02 +0000
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 kernel <kernel@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dump gmac4 DMA registers
	correctly
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
Content-Type: multipart/mixed; boundary="===============8493199983543526089=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8493199983543526089==
Content-Type: multipart/alternative;
	boundary="------------2WWsCl0pVLe6K4k3S4Nut9ZV"
Content-Language: en-US

--------------2WWsCl0pVLe6K4k3S4Nut9ZV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 1/28/22 23:29, Jakub Kicinski wrote:
> On Fri, 28 Jan 2022 16:36:42 +0100 Camel Guo wrote:
> > From: Camel Guo <camelg@axis.com>
> >
> > Unlike gmac100, gmac1000, gmac4 has 27 DMA registers and they are
> > located at DMA_CHAN_BASE_ADDR (0x1100). In order for ethtool to dump
> > gmac4 DMA registers correctly, this commit checks if a net_device has
> > gmac4 and uses different logic to dump its DMA registers.
> >
> > This fixes the following KASAN warning, which can normally be triggered
> > by a command similar like "ethtool -d eth0":
> >
> > BUG: KASAN: vmalloc-out-of-bounds in dwmac4_dump_dma_regs+0x6d4/0xb30
> > Write of size 4 at addr ffffffc010177100 by task ethtool/1839
> >  kasan_report+0x200/0x21c
> >  __asan_report_store4_noabort+0x34/0x60
> >  dwmac4_dump_dma_regs+0x6d4/0xb30
> >  stmmac_ethtool_gregs+0x110/0x204
> >  ethtool_get_regs+0x200/0x4b0
> >  dev_ethtool+0x1dac/0x3800
> >  dev_ioctl+0x7c0/0xb50
> >  sock_ioctl+0x298/0x6c4
> >  ...
> >
> > Signed-off-by: Camel Guo <camelg@axis.com>
>
> Can we get a Fixes tag for this? If it was always broken the Fixes tag
> should point to the commit which added gmac4 support.

Done in v2. Please review PATCH v2 instead.

--------------2WWsCl0pVLe6K4k3S4Nut9ZV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/28/22 23:29, Jakub Kicinski wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20220128142955.047bd9d4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style>.EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; }</style>
      <font size="2"><span style="font-size:10pt;">
          <div class="PlainText">On Fri, 28 Jan 2022 16:36:42 +0100
            Camel Guo wrote:<br>
            &gt; From: Camel Guo <a class="moz-txt-link-rfc2396E" href="mailto:camelg@axis.com">&lt;camelg@axis.com&gt;</a><br>
            &gt; <br>
            &gt; Unlike gmac100, gmac1000, gmac4 has 27 DMA registers
            and they are<br>
            &gt; located at DMA_CHAN_BASE_ADDR (0x1100). In order for
            ethtool to dump<br>
            &gt; gmac4 DMA registers correctly, this commit checks if a
            net_device has<br>
            &gt; gmac4 and uses different logic to dump its DMA
            registers.<br>
            &gt; <br>
            &gt; This fixes the following KASAN warning, which can
            normally be triggered<br>
            &gt; by a command similar like "ethtool -d eth0":<br>
            &gt; <br>
            &gt; BUG: KASAN: vmalloc-out-of-bounds in
            dwmac4_dump_dma_regs+0x6d4/0xb30<br>
            &gt; Write of size 4 at addr ffffffc010177100 by task
            ethtool/1839<br>
            &gt;  kasan_report+0x200/0x21c<br>
            &gt;  __asan_report_store4_noabort+0x34/0x60<br>
            &gt;  dwmac4_dump_dma_regs+0x6d4/0xb30<br>
            &gt;  stmmac_ethtool_gregs+0x110/0x204<br>
            &gt;  ethtool_get_regs+0x200/0x4b0<br>
            &gt;  dev_ethtool+0x1dac/0x3800<br>
            &gt;  dev_ioctl+0x7c0/0xb50<br>
            &gt;  sock_ioctl+0x298/0x6c4<br>
            &gt;  ...<br>
            &gt; <br>
            &gt; Signed-off-by: Camel Guo <a class="moz-txt-link-rfc2396E" href="mailto:camelg@axis.com">&lt;camelg@axis.com&gt;</a><br>
            <br>
            Can we get a Fixes tag for this? If it was always broken the
            Fixes tag<br>
            should point to the commit which added gmac4 support.<br>
          </div>
        </span></font>
    </blockquote>
    <p>Done in v2. Please review PATCH v2 instead. <br>
    </p>
  </body>
</html>

--------------2WWsCl0pVLe6K4k3S4Nut9ZV--

--===============8493199983543526089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8493199983543526089==--
