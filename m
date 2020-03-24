Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B51917EE
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 18:45:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACC12C36B0B;
	Tue, 24 Mar 2020 17:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68D12C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=gm8o3p9zY1Nww2ErmVEzpZYR85DamogULeQ92HOiqsg=; b=MJ5Q2eN7pgjMr1qGPiNVaVF4YX
 S8uK2Ve6zQ5viz+aS2zad3jugoq82QLkfDEvjP1Y1VAoEsIodg9B5iyueY7TP7ZdJlBbZQqSuHgJ4
 imKPSmGBmU2IEGVMM4m8i7Ds1nRMIQ/xtRjA62qBIjnsNOT3BR03YwYnUwUPnIEIxkI6WJzEh1XOZ
 YXi03zulnM4gdykL0w1Xrncmf4zZrBJxhD++gWzKygcl6il2jlaYDDZravNtlnS2buJ7R+is5Fpzc
 KzoAAsTpyeotKdGewfwZ139mXokDXhzia8ZOAtpKKZ0Hbpbj1ji0tfYqUymXuhYLsLeD5St42NP/1
 KqfQQ6Vw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGnbi-00021Q-Jv; Tue, 24 Mar 2020 17:44:54 +0000
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8821448b-3c6e-6277-06d2-9be7f81de9e9@infradead.org>
Date: Tue, 24 Mar 2020 10:44:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324170407.16470-3-arnaud.pouliquen@st.com>
Content-Language: en-US
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 xiang xiao <xiaoxiang781216@gmail.com>
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

Hi,

On 3/24/20 10:04 AM, Arnaud Pouliquen wrote:
> This driver exposes a standard TTY interface on top of the rpmsg
> framework through a rpmsg service.
> 
> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> per rpmsg endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  Documentation/serial/tty_rpmsg.rst |  45 ++++
>  drivers/tty/Kconfig                |   9 +
>  drivers/tty/Makefile               |   1 +
>  drivers/tty/rpmsg_tty.c            | 417 +++++++++++++++++++++++++++++
>  4 files changed, 472 insertions(+)
>  create mode 100644 Documentation/serial/tty_rpmsg.rst
>  create mode 100644 drivers/tty/rpmsg_tty.c
> 
> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> new file mode 100644
> index 000000000000..fc1d3fba73c5
> --- /dev/null
> +++ b/Documentation/serial/tty_rpmsg.rst
> @@ -0,0 +1,45 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=============
> +The rpmsg TTY
> +=============
> +
> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for user-space programs to send and receive rpmsg messages as a standard tty protocol.

                                                                         to make it possible

> +
> +The remote processor can instantiate a new tty by requesting:
> +- a "rpmsg-tty-raw" RPMsg service, for TTY raw data support without flow control
> +- a "rpmsg-tty-ctrl" RPMSg service, for TTY support with flow control.
> +
> +Information related to the RPMsg and associated tty device is available in
> +/sys/bus/rpmsg/devices/.
> +
> +RPMsg TTY without control
> +---------------------

extend underline under "control"

> +
> +The default end point associated with the "rpmsg-tty-raw" service is directly
> +used for data exchange. No flow control is available.
> +
> +To be compliant with this driver, the remote firmware must create its data end point associated with the "rpmsg-tty-raw" service.
> +
> +RPMsg TTY with control
> +---------------------

extend underline length.

> +
> +The default end point associated with the "rpmsg-tty-ctrl" service is reserved for
> +the control. A second endpoint must be created for data exchange.
> +
> +The control channel is used to transmit to the remote processor the CTS status,
> +as well as the end point address for data transfer.
> +
> +To be compatible with this driver, the remote firmware must create or use its end point associated with "rpmsg-tty-ctrl" service, plus a second endpoint for the data flow.
> +On Linux rpmsg_tty probes, the data endpoint address and the CTS (set to disable)
> +is sent to the remote processor.
> +The remote processor has to respect following rules:

                               respect the following rules:

> +- It only transmits data when Linux remote cts is enable, otherwise message

                                              CTS is enabled,

> +  could be lost.
> +- It can pause/resume reception by sending a control message (rely on CTS state).
> +
> +Control message structure:
> +struct rpmsg_tty_ctrl {
> +	u8 cts;			/* remote reception status */
> +	u16 d_ept_addr;		/* data endpoint address */
> +};

Is that struct packed or padded?



-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
