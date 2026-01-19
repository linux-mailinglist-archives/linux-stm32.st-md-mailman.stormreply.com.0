Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F167D3AE28
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 16:04:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 021B0C36B3C;
	Mon, 19 Jan 2026 15:04:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D2B1C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 15:04:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9869BC214CB;
 Mon, 19 Jan 2026 15:03:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9205360731;
 Mon, 19 Jan 2026 15:04:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F62010B6B0FF; Mon, 19 Jan 2026 16:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768835045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=cSmKic32n6ti5xOcPpQbUlIndt/JhQ9yoiHmChcJtRE=;
 b=hEzL6BaFT066Dkq6fkn2iM8Cz98b9mOWoul5nqw+sxKA/HI+bwQEt+qHbTNi6G6Ej27iPg
 RFubusD5i4DA6w0h3GAF8jpMFiAAAf/uGdfucxGXWfSKQHuHYPKvSkMoCFYJd6GXDJWYMS
 lpnmGML26CfYqmYQEWDSZmuJM/iht/h3uxWbSpJh4CpQrQqKyEFu2F+eXXjAXH7MsSMpKM
 J58IWOFFRwFzQMJ7QjMiUpJxZHM/8flWTmoq6N2Y95gngvgSooRxl1CnZZohnW96H3z9FX
 jQsooIGcyvRKE3u+Yg8J6czEHiItf9ezstKd5s1PDkmwgKFyexWaZXUZBrtvbQ==
Message-ID: <33b06fd6-3eb3-4eb7-8091-7ebe8a8373ba@bootlin.com>
Date: Mon, 19 Jan 2026 16:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: enable RPS and
	RBU interrupts
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

Hi Russell,

On 17/01/2026 00:25, Russell King (Oracle) wrote:
> Enable receive process stopped and receive buffer unavailable
> interrupts, so that the statistic counters can be updated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> Maxime,
> 
> You may find this patch useful, as it makes the "rx_buf_unav_irq"
> and "rx_process_stopped_irq" ethtool statistic counters functional.
> This means that the lack of receive descriptors can still be detected
> even if the receive side doesn't actually stall.
> 
> I'm not sure why we publish these statistic counters if we don't
> enable the interrupts to allow them to ever be non-zero.

It works, I can indeed see the stats get properly updated on imx8mp :)

There's one downside to it though, which is that as soon as we hit a situation
where we don't have RX bufs available, this patchs has a tendancy to make things
worse as we'll trigger interrupts for each packet we receive and that we can't
process, making it even longer for queues to be refilled.

It shows on iperf3 with small packets :

---- Before patch, 17% packet loss on UDP 56 bytes packets -----------------

# iperf3 -u -b 0 -l 56 -c 192.168.2.1 -R
Connecting to host 192.168.2.1, port 5201
Reverse mode, remote host 192.168.2.1 is sending
[  5] local 192.168.2.18 port 47851 connected to 192.168.2.1 port 5201
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-1.00   sec  10.7 MBytes  90.0 Mbits/sec  0.003 ms  48550/249650 (19%)  
[  5]   1.00-2.00   sec  11.3 MBytes  95.0 Mbits/sec  0.003 ms  41881/253832 (16%)  
[  5]   2.00-3.00   sec  11.3 MBytes  94.9 Mbits/sec  0.002 ms  42060/253913 (17%)  
[  5]   3.00-4.00   sec  11.3 MBytes  95.1 Mbits/sec  0.003 ms  41499/253785 (16%)  
[  5]   4.00-5.00   sec  11.3 MBytes  94.6 Mbits/sec  0.003 ms  42663/253787 (17%)  
[  5]   5.00-6.00   sec  11.3 MBytes  94.9 Mbits/sec  0.006 ms  41976/253719 (17%)  
[  5]   6.00-7.00   sec  11.3 MBytes  94.5 Mbits/sec  0.003 ms  43133/253999 (17%)  
[  5]   7.00-8.00   sec  11.3 MBytes  95.0 Mbits/sec  0.004 ms  41442/253579 (16%)  
[  5]   8.00-9.00   sec  11.4 MBytes  95.2 Mbits/sec  0.004 ms  41518/254131 (16%)  
[  5]   9.00-10.00  sec  11.2 MBytes  94.3 Mbits/sec  0.006 ms  43580/254143 (17%)  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-10.00  sec   135 MBytes   114 Mbits/sec  0.000 ms  0/0 (0%)  sender
[  5]   0.00-10.00  sec   112 MBytes  94.3 Mbits/sec  0.006 ms  428302/2534538 (17%)  receiver

iperf Done.
# ethtool -S eth1 | grep rx_buf_unav_irq
     rx_buf_unav_irq: 0

---- After patch, 22% packet loss on UDP 56 bytes packets ----------------------

# iperf3 -u -b 0 -l 56 -c 192.168.2.1 -R
Connecting to host 192.168.2.1, port 5201
Reverse mode, remote host 192.168.2.1 is sending
[  5] local 192.168.2.18 port 42121 connected to 192.168.2.1 port 5201
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-1.00   sec  10.3 MBytes  85.8 Mbits/sec  0.004 ms  55146/247172 (22%)  
[  5]   1.00-2.00   sec  10.6 MBytes  89.1 Mbits/sec  0.003 ms  54699/253355 (22%)  
[  5]   2.00-3.00   sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  55231/253887 (22%)  
[  5]   3.00-4.00   sec  10.6 MBytes  88.9 Mbits/sec  0.003 ms  55138/253602 (22%)  
[  5]   4.00-5.00   sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  54938/253722 (22%)  
[  5]   5.00-6.00   sec  10.6 MBytes  88.9 Mbits/sec  0.003 ms  55273/253580 (22%)  
[  5]   6.00-7.00   sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  55202/253986 (22%)  
[  5]   7.00-8.00   sec  10.6 MBytes  89.1 Mbits/sec  0.003 ms  55047/253958 (22%)  
[  5]   8.00-9.00   sec  10.6 MBytes  88.9 Mbits/sec  0.003 ms  55612/254140 (22%)  
[  5]   9.00-10.00  sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  55683/254403 (22%)  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-10.00  sec   135 MBytes   113 Mbits/sec  0.000 ms  0/0 (0%)  sender
[  5]   0.00-10.00  sec   106 MBytes  88.7 Mbits/sec  0.003 ms  551969/2531805 (22%)  receiver

iperf Done.
# ethtool -S eth1 | grep rx_buf_unav_irq
     rx_buf_unav_irq: 30624


So clearly there are pros and cons with this, but I don't want to fall into the
"let's not break microbenchmarks" pitfall.

I personnaly find the stat useful, so :

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>


Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
