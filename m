Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3B191B7F
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 21:52:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EBCBC36B0B;
	Tue, 24 Mar 2020 20:52:18 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DDD1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 20:52:15 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x1so3890997plm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RUH2GpKiZzcp+HWMY8/0tgoroE59nDoZuKy+VZo5HoQ=;
 b=ntboDvPpO4mkIqoOhoGXBG65LwzTrCrhDR8XrhgItSkYAvVx0nDaIFCBhgwlE8+b3B
 y6p8/oHwZoumQYYk3A1AzzxHVkXT6O6foFkaxu4imEmIvRAWv/oMpfPHGgbxrTvRWSJk
 gIFK1Am2GLRwaAk5axXIPgh23srMlz0n3DanoTyOa9GDaxu/vLb4pd80gJuGfXRZvFfN
 9yYECe7ugpWAGzj2sy3/0p4O61zScSUI1p0bkfKRlTrUSt8hghGolfUp584p846q7sI+
 TWvUS7SFV62KctatZgmzNHcZ4+uPfa12URZyyig2GjXYpWMhIgTHXJNzdoKULwuNqvOT
 xpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RUH2GpKiZzcp+HWMY8/0tgoroE59nDoZuKy+VZo5HoQ=;
 b=QOh17PR6OJ6uaC53Umqweb6/AHW/fL3aY40Nsmbmokv1AeKyblfZPoCQKw8rsrZUx9
 wt9UbjJBPDTwhbiijah7D63oY/jMZRdQD14XM+2n+dkH10UPL2fU8Qz9es9f/BOizUbL
 hCW4229ePzxHMrUeJzA0T0210fzG8NThkgVf+q9MSH2Yj34o8cLjZgPZHt8SQ4alziHl
 X7Tlguf2jnvvFlTXzqzbwRZoK+8ud+9w1Dzm6onumQxEcfUPFovVCEeR+CZ7gn6NReuR
 0yHs2gzxNZbL9YfDuJTH7aPBtrZsynHkT5WjuyXTvkW1sjKpXiZ8pau9MZinOCgeoRGV
 ENHg==
X-Gm-Message-State: ANhLgQ2TOXSL+Bx8lZfq6iXMH3IYEKifixlS+kxQe8d7z3lwj1dXqryL
 +I5vhoj68gpQIMQixPnkko8Kkg==
X-Google-Smtp-Source: ADFU+vuFTdjBOEELC4vADOx1eo0GZ5R9fhZn/of+Gz8RGRkQBwgXM30Df8fjCPIj52s2Ffu2c1Bidw==
X-Received: by 2002:a17:902:b281:: with SMTP id
 u1mr6218733plr.287.1585083133418; 
 Tue, 24 Mar 2020 13:52:13 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id z6sm16696078pfn.212.2020.03.24.13.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 13:52:12 -0700 (PDT)
Date: Tue, 24 Mar 2020 13:52:10 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200324205210.GE119913@minitux>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324170407.16470-3-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 xiang xiao <xiaoxiang781216@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Jiri Slaby <jslaby@suse.com>,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 2/2] tty: add rpmsg driver
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

On Tue 24 Mar 10:04 PDT 2020, Arnaud Pouliquen wrote:
[..]
> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
> index 020b1cd9294f..c2465e7ebc2a 100644
> --- a/drivers/tty/Makefile
> +++ b/drivers/tty/Makefile
> @@ -34,5 +34,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>  obj-$(CONFIG_VCC)		+= vcc.o
> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>  
>  obj-y += ipwireless/
> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
[..]
> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
> +	{ .name	= TTY_CH_NAME_RAW },
> +	{ .name	= TTY_CH_NAME_WITH_CTS},

I still don't like the idea that the tty devices are tied to channels by
fixed names.

This makes the driver unusable for communicating with any firmware out
there that provides tty-like data over a channel with a different name -
such as modems with channels providing an AT command interface (they are
not named "rpmsg-tty-raw").

I also fail to see how you would distinguish ttys when the firmware
provides more than a single tty - e.g. say you have a modem-like device
that provides an AT command channel and a NMEA stream.


These are the reasons why drivers/rpmsg/rpmsg_char registers a "control
device", from which you can spawn new char devices. As I've said before,
I really think the same approach should be taken for ttys - perhaps by
just extending the rpmsg_char to allow it to create tty devices in
addition to the "packet based" char device?

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
