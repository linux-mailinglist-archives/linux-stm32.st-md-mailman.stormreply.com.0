Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4F2EA046
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 00:03:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FCA7C56634;
	Mon,  4 Jan 2021 23:03:25 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CAE9C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 23:03:22 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id n42so27607603ota.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 15:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PQqz8iYh4JjR1R024ILlEO8eb3o6zDUF7NbI3cgZ5No=;
 b=AAiSUFOgYQGBzGI2oru3BuvBQGFyXAW+J/5WeKu3/Im4RYrq6YBywGpqK8ZoGzhuk7
 k6AWmL9NdCiLu/0cUJ0OTGdSuS65wF9maB8Ac2u4HBt0bdRcxm1PiXiUQ3L5U9ess6bq
 BtdrVM1YkjGKd/ppINOHQntTYHZsk21O2vYMg2ugWHlSZ5zO+WcjPf1GRHAYgVcFKh83
 1aA4lixO/jA5gBNReHsChXY5o+1fLl3iB1PE0VK6BuOcd3ljJ+mRiNUhCPdPQcSMNSmF
 P3f7uCC/nOp6mk+18DNwnUVTndgLcnO47t2gTnjc8RftTmKKHPqEduKvRJhqIrN3ktGl
 ykog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PQqz8iYh4JjR1R024ILlEO8eb3o6zDUF7NbI3cgZ5No=;
 b=XdCcLleG7DLRILKWCBA7BGetPlnSEzytLJfLThi+FyhrfWShbrw+LY7CjoFFfoxvZn
 i8N5oj+YDGi8ruTSvpGpeH+nislHp6soflDQrbeDhho22avtpF2WbV3XqZsrKKPhNwVv
 rTXv4NsE2V5kagyuSR7SWUPZpgchgS8LOVA0vf81ETtC5DeNFO2YerZHTOLApTV2jg0Z
 d18Tcu05cmzBYLyqsWxoFp4U3Rx4e4W8v/WLZ2BNZjIeMZdSubNxmNKfl/+ORWj3UfNs
 A4ijc1IZtmGIucc2mFcdP5x13Xi1xbr7dUnMG1xCemkPFtV0YOXg6hz3sKr+hIqMXH/n
 RPyw==
X-Gm-Message-State: AOAM53054OObyRpYGCYonFnMuKEL2GuxrtAr5SMVLNs4N3aferGLVtqY
 qqJzXB7TxfPOgVXbgOVBB21yCA==
X-Google-Smtp-Source: ABdhPJw0jWCPgRx8zQF4M6NIie7Lh8JkBAQxRpc6r2RC+I9EUA2tZK8oqyXXTb+/6PiPPvzexUSEIg==
X-Received: by 2002:a9d:4b17:: with SMTP id q23mr53766028otf.157.1609801401370; 
 Mon, 04 Jan 2021 15:03:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r15sm13529779oie.33.2021.01.04.15.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 15:03:20 -0800 (PST)
Date: Mon, 4 Jan 2021 17:03:19 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/Oet4lT9Hf14adx@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 00/16] introduce generic IOCTL
 interface for RPMsg channels management
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

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> This series is a restructuring of the RPMsg char driver, to create a generic
> RPMsg ioctl interface for all rpmsg services.
> 
> The RPMsg char driver provides interfaces that:
> - expose a char RPMsg device for communication with the remote processor,
> - expose controls interface for applications to create and release endpoints.
> 
> The objective of this series is to decorrelate the two interfaces:
>   - Provide a char device for a RPMsg raw service in the rpmsg_char that can be
>     probed by a RPMsg bus on a ns announcement.
>   - Generalize the use of the ioctl for all RPMsg services by creating the
>     rpmsg_ctrl, but keep it compatibile with the legacy.
> 
> If the V1 create a new rpmsg_raw driver in addition to the rpmsg_ctrl this
> version try to reuse the rpmsg_char driver by addapting QCOM GLINK and SMD
> drivers.
> So a goal of this version is to help to determine the best strategy to move
> forward:
>   - reuse rpmsg_char.
>   - introduce a new driver and keep rpmsg_char as a legacy driver for a while.
> 
> Notice that SMD and GLINK patches have to be tested, only build has been tested.
> 
> 1) RPMsg control driver: rpmsg_ctrl.c
>   This driver is based on the control part of the RPMsg_char driver. 
>   On probe a /dev/rpmsg_ctrl<X> interface is created to allow to manage the
>   channels.
>   The principles are the following:
>   - The RPMsg service driver registers it's name and the associated service
>     using the rpmsg_ctrl_unregister_ctl API. The list of supported services
>     is defined in  include/uapi/linux/rpmsg.h and exposed to the
>     application thanks to a new field in rpmsg_endpoint_info struct.
>   - On the RPMsg bus probe(e.g virtio bus) an rpmsg_ctrl device is
>     registered that creates the control interface.
>   - The application can then create or release a channel by specifying:
>        - the name service
>        - the source address.
>        - the destination address.

Why is this useful?

>   - The rpmsg_ctrl uses the same interface than the ns announcement to
>     create and release the associated channel but using the driver_override
>     field to force the service name.
>     The  "driver_override" allows to force the name service associated to
>     an RPMsg driver, bypassing the rpmsg_device_id based match check.

You mean, the chinfo driver_override allows the ioctl to specify which
driver should be bound to the device created for the newly registered
endpoint?

>   - At least for virtio bus, an associated ns announcement is sent to the
>     remote side.  
> 
> 2) rpmsg char driver: rpmsg_char.c
>     - The rpmsg class has not been removed. The associated attributes
>       are already available in /sys/bus/rpmsg/.

So today a rpmsg_device gets the same attributes both from the class and
the bus? So the only difference is that there will no longer be a
/sys/class/rpmsg ?

Regards,
Bjorn

>     - The eptdev device is now an RPMsg device probed by a RPMsg bus driver
>       (probed only by the ioctl in rpmsg_char driver).
> 
> Know current Limitations:
> - Tested only with virtio RPMsg bus and for one vdev instance.
> - The glink and smd drivers adaptations have not been tested (not able to test).
> - To limit commit and not update the IOCT interface some features have been not
>   implemented in this first step:
>     - the NS announcement as not been updated, it is not possible to create an
>       endpoint with a destibnation address set to RPMSG_ADDR_ANY (-1),
>     - not possible to destroy the channel,
>     - only the "rpmsg-raw" service is supported.
> 
> This series can be applied in Bjorn's rpmsg-next branch on top of the
> RPMsg_ns series(4c0943255805).
> 
> This series can be tested using rpmsgexport tools available here:
> https://github.com/andersson/rpmsgexport.
> ---
> new from V1[1]:
> - In V1 the rpmsg_char.c was not impacted, a rpmsg_raw.c has been created
>   instead.
> - IOCTL interface as not been updated (to go by steps).
> - smd and glink drivers has been updated to support channels creation and
>   release.
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=327277
> 
> Arnaud Pouliquen (16):
>   rpmsg: introduce RPMsg control driver for channel creation
>   rpmsg: add RPMsg control API to register service
>   rpmsg: add override field in channel info
>   rpmsg: ctrl: implement the ioctl function to create device
>   rpmsg: ns: initialize channel info override field
>   rpmsg: add helper to register the rpmsg ctrl device
>   rpmsg: char: clean up rpmsg class
>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>   rpmsg: char: allow only one endpoint per device
>   rpmsg: char: check destination address is not null
>   rpmsg: virtio: use the driver_override in channel creation ops
>   rpmsg: virtio: probe the rpmsg_ctl device
>   rpmsg: glink: add create and release rpmsg channel ops
>   rpmsg: smd: add create and release rpmsg channel ops
>   rpmsg: replace rpmsg_chrdev_register_device use
> 
>  drivers/rpmsg/Kconfig             |   8 +
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>  include/linux/rpmsg.h             |  40 ++++
>  include/uapi/linux/rpmsg.h        |  14 ++
>  11 files changed, 606 insertions(+), 231 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
