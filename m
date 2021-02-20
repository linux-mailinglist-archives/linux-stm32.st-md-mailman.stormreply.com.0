Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B1320679
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Feb 2021 18:51:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2110AC5719D;
	Sat, 20 Feb 2021 17:51:06 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8942DC5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Feb 2021 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cxAy898ikaXB5b80r/PivtPGuAM/Ddrpj1pSL31gbP0=; b=MBv+GmIm+3Sdm5COSX/SJIdBQa
 CfnIkjFxBaCtDGZKCRL4aQU00LYN2sl+rRK0MDg/r/8P4r1nXT1Q0pQQEz4Kyi++M/Jw09h2PW/zc
 /K/HtuKLEaioCv/L4Enmj+OqH9Jl+VEmA1Oj4xzl4L2tdkMSMLwZ1DO1Cx+B5Up2rIZ+YwdIM7TEq
 geK5tuR/ivVFJqeViOGeTBXy/IVTXhUy/6M9FsGidExjULnmvtz0f4nPqM/0zHYnNTIGGvhAPWL5g
 +800y493IiiTVPr3suSdrJ5fmCKBpVov8H8skohMScjucnGPqXTBshhOSmPoRmC/sYX/ipLpRIop3
 gCgBNraQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:58766 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1lDWP8-0001tJ-DN; Sat, 20 Feb 2021 12:50:54 -0500
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <3fc2580af0efd6312a64a0e107bd6fa758f0d466.1613131238.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <2d9c7cfe-1f26-22b4-281f-63a7a1801452@lechnology.com>
Date: Sat, 20 Feb 2021 11:50:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3fc2580af0efd6312a64a0e107bd6fa758f0d466.1613131238.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 13/22] counter: Internalize sysfs
	interface code
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

On 2/12/21 6:13 AM, William Breathitt Gray wrote:
> This is a reimplementation of the Generic Counter driver interface.
> There are no modifications to the Counter subsystem userspace interface,
> so existing userspace applications should continue to run seamlessly.
> 
> The purpose of this patch is to internalize the sysfs interface code
> among the various counter drivers into a shared module. Counter drivers
> pass and take data natively (i.e. u8, u64, etc.) and the shared counter
> module handles the translation between the sysfs interface and the
> device drivers. This guarantees a standard userspace interface for all
> counter drivers, and helps generalize the Generic Counter driver ABI in
> order to support the Generic Counter chrdev interface (introduced in a
> subsequent patch) without significant changes to the existing counter
> drivers.
> 
> Note, Counter device registration is the same as before: drivers
> populate a struct counter_device with components and callbacks, then
> pass the structure to the devm_counter_register function. However,
> what's different now is how the Counter subsystem code handles this
> registration internally.
> 
> Whereas before callbacks would interact directly with sysfs data, this
> interaction is now abstracted and instead callbacks interact with native
> C data types. The counter_comp structure forms the basis for Counter
> extensions.
> 
> The counter-sysfs.c file contains the code to parse through the
> counter_device structure and register the requested components and
> extensions. Attributes are created and populated based on type, with
> respective translation functions to handle the mapping between sysfs and
> the counter driver callbacks.
> 
> The translation performed for each attribute is straightforward: the
> attribute type and data is parsed from the counter_attribute structure,
> the respective counter driver read/write callback is called, and sysfs
> I/O is handled before or after the driver read/write function is called.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Patrick Havelange <patrick.havelange@essensium.com>
> Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: David Lechner <david@lechnology.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---

For TI eQEP bits...

Reviewed-by: David Lechner <david@lechnology.com>
Tested-by: David Lechner <david@lechnology.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
