Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 703F02211DF
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 18:06:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FE7C36B29;
	Wed, 15 Jul 2020 16:06:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 208EAC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 16:06:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FFqh3d030962; Wed, 15 Jul 2020 18:06:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VxjdMpcXN79GVQ3jPVzbk6I3tuoSCoV11faoa+SlGGI=;
 b=0ViChu9TZbG0vELUnZ7hnwVFkWnPfXUPZz421JH2+6TXkR5fxPnr/4AoGEmRaMyA5o0E
 JFk++uqxQVxM5ZYzB46rsxykc7Cug2RIlRCCZzEGGQjq5PEIHpm/2gB7Tf51EhNkx8Wy
 B01ZOsma7XtWsXpt5kDx/HaDEzXXk+pgHJhXgfzOQRAOD7KSQ4FpLKZLCF5To8rNTdB5
 66b9vsHxt5B+TXyCzAP102i4z7jYJERv94CWYC+vlL3wopBpEqFryMf8exnoZKr/TgRp
 33eKppjknyx4WJY8LZTsaiEaFx3b7uK9OWzT1694oaeHAXg7PFBKuZsqBQJ3HUK7tlqv Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 327cyv5baq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 18:06:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A85910002A;
 Wed, 15 Jul 2020 18:06:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 825E12AEEA6;
 Wed, 15 Jul 2020 18:06:37 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 18:06:36 +0200
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <98271538-d7b4-cf48-abda-3a6c8cd45ee5@st.com>
Date: Wed, 15 Jul 2020 18:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170407.16470-1-arnaud.pouliquen@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 xiang xiao <xiaoxiang781216@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 0/2] Add rpmsg tty driver
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



On 3/24/20 6:04 PM, Arnaud Pouliquen wrote:
> This patch set introduces a TTY console on top of the RPMsg framework which
> enables the following use cases:
> - Provide a console to communicate easily with the remote processor application.
> - Provide an interface to get the remote processor log traces without ring
>   buffer limitation.
> - Ease the migration from MPU + MCU processors to multi core processors
>   (MPU and MCU integrated in one processor) by offering a virtual serial link.
> 
> An alternative of this proposed solution would consist in using the virtio
> console:
> The drawback with that solution is that it requires a specific virtio buffer
> (in addition to the one already used for RPMsg) which does not fit with remote
> processors with little memory. The proposed solution allows to multiplex the
> console with the other rpmsg services, optimizing the memory.
> 
> The first patch adds an API to the rpmsg framework ('get max transmission unit')
> and the second one is the rpmsg tty driver itself.
> 
> Previous revision:
> - the patch 1/2 ("rpmsg: core: add API to get MTU) has been discussed in a
>   separate thread on remoteproc mailing list:
>     https://patchwork.kernel.org/patch/11333509/
> - Previous version of the patch 2/2 (tty: add rpmsg driver) available here:
>     https://patchwork.kernel.org/cover/11130213/
> 
> Main delta vs v6:
>  - Pack the rpmsg_tty_ctrl struct.
>  - MTU API acked by Suman Anna from Texas Intruments company. 
> 
> Arnaud Pouliquen (2):
>   rpmsg: core: add API to get MTU
>   tty: add rpmsg driver
> 
>  Documentation/serial/tty_rpmsg.rst |  45 ++++
>  drivers/rpmsg/rpmsg_core.c         |  21 ++
>  drivers/rpmsg/rpmsg_internal.h     |   2 +
>  drivers/rpmsg/virtio_rpmsg_bus.c   |  10 +
>  drivers/tty/Kconfig                |   9 +
>  drivers/tty/Makefile               |   1 +
>  drivers/tty/rpmsg_tty.c            | 417 +++++++++++++++++++++++++++++
>  include/linux/rpmsg.h              |  10 +
>  8 files changed, 515 insertions(+)
>  create mode 100644 Documentation/serial/tty_rpmsg.rst
>  create mode 100644 drivers/tty/rpmsg_tty.c
> 

Series put on hold after discussion with Bjorn. First we need to define the interface and mechanism
to allow any service name to be associated with an rpmsg service based on the IOCTL user interface. 
The goal is to allow the Linux application to initiate the link. This work will be done on the 
rpmsg char and then extend to other generic interfaces such as TTY.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
