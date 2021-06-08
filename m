Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4939F1AE
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 11:08:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A45A8C57B79;
	Tue,  8 Jun 2021 09:08:09 +0000 (UTC)
Received: from mail.iot.bzh (mail.iot.bzh [51.75.236.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0B15C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 09:08:01 +0000 (UTC)
Received: from localhost.localdomain
 (lfbn-ren-1-1868-231.w83-199.abo.wanadoo.fr [83.199.51.231])
 by mail.iot.bzh (Postfix) with ESMTPSA id C5E0940081;
 Tue,  8 Jun 2021 11:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
 t=1623143279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RstX5K6XZCEekqSBLBKXhSYsL5WzEMK2zaZ0jTY6khU=;
 b=tm+rCUB9f9l4wf3L0Lbg9qS2pGscYdvzAd0HuZDfOxdD2JoXGWLw/UZoyuuEguV0MDUeVO
 Vft2nqCLDB9zdC9Ybz5Zb6/gTEtxBHbjNdIyCjuxrTeNmMb5/fRA714qqiPDDK+u8lTUH4
 b+EehnJwjj/pObY1pwShtya3ieU2Xhnqq6G00c67I4XYgyH04ZiyyOlDOdQXN0HsODQ+C5
 O0z53YOl+zIkiy56OpCQZTj4TByAruiAsdCI2TsLnEI/pvkNQqVRskEhtK3HkEIka4Lp3F
 2fjVpFZ0nfDNoUrZ3nlU74i4fGzxELhWKJBBbcvita9auk/lWOZWJuVarmAtbA==
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
From: Julien Massot <julien.massot@iot.bzh>
Message-ID: <6aedbe64-9c5d-b738-ad99-0a33733be82d@iot.bzh>
Date: Tue, 8 Jun 2021 11:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/4] rpmsg: char: introduce the rpmsg-raw
	channel
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 6/7/21 7:30 PM, Arnaud Pouliquen wrote:
> Purpose:
>    Allow the remote processor to instantiate a /dev/rpmsgX interface relying on the NS announcement
>    of the "rpmsg-raw" service.
>    This patchet is extracted from  the series [1] with rework to add rpmsg_create_default_ept helper.
> 
>    
> Aim:
>    There is no generic sysfs interface based on RPMsg that allows a user application to communicate
>    with a remote processor in a simple way.
>    The rpmsg_char dev solves a part of this problem by allowing an endpoint to be created on the
>    local side. But it does not take advantage of the NS announcement mechanism implemented for some
>    backends such as the virtio backend. So it is not possible to probe it from  a remote initiative.
>    Extending the char rpmsg device to support NS announcement makes the rpmsg_char more generic.
>    By announcing a "rpmg-raw" service, the firmware of a remote processor will be able to
>    instantiate a /dev/rpmsgX interface providing to the user application a basic link to communicate
>    with it without any knowledge of the rpmsg protocol.
> 
> Implementation details:
>    - Register a rpmsg driver for the rpmsg_char driver, associated to the "rpmsg-raw" channel service.
>    - In case of rpmsg char device instantiated by the rpmsg bus (on NS announcement) manage the
>      channel default endpoint to ensure a stable default endpoint address, for communication with
>      the remote processor.
> 
> How to test it:
>    - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
>      + the "Restructure the rpmsg char to decorrelate the control part" series[2]
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
> [2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793

Just tested this whole series on remoteproc for-next branch + [2].
Works for me, /dev/rpmsg0 is created on NS announcement, and removed when stopping the remote processor.
I can do a repeated series of open /read/write/close, and got EBUSY if I try to open it more than once
at a time.

Firmware used for testing is derived from:
https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table
with:
#define RPMSG_CHAN_NAME "rpmsg-raw"

Thanks Arnaud for your work.

Tested-by: Julien Massot <julien.massot@iot.bzh>

-- 
Julien Massot [IoT.bzh]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
