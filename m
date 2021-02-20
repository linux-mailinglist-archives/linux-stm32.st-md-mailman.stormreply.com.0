Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD53320648
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Feb 2021 17:48:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D71CC5719D;
	Sat, 20 Feb 2021 16:48:53 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80221C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Feb 2021 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vNEM/tON1M86XHMaCI4bAnuASZzABcq6rX1zJ37Bdqo=; b=IVQz5B8XsyLuXnlRA4Cbg7u2Fx
 6UQnBt0S6+qDgbUG0yL6Yaj6J3LShaR5qB96dF7gO4MVOTm8CzTQ+KP0yjgdFkVkYzW9+OW0MzeLE
 pb7P8heKA+mtCk5DPs/AqurYPWmYMRIck7c8XYDrXrrDduV9zRiCZkf9D4E7EVWjh0xV3Oo83k5E+
 5/5zD8rV7OVG6ReTeNMO7BJnPWvIvEt16djjQ5LHwGJoiP/f2PhXTh+PkA7mYwbOZExpjyZ9RqV+H
 j0BMGl4lXXvNrUz0AsNx8wdASRpwJ+JQLuhIL4WCjdRR+BXjKbukrzk03/lB8UV6LnmHudX01cDYW
 qD7eRZzQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:57734 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1lDVR0-0003Fq-US; Sat, 20 Feb 2021 11:48:47 -0500
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <7fa80c10fcd10d1d47d1bddced2b2cca3ff59ba9.1613131238.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <f382ce84-8a47-6315-9bdb-9d9957f1800b@lechnology.com>
Date: Sat, 20 Feb 2021 10:48:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7fa80c10fcd10d1d47d1bddced2b2cca3ff59ba9.1613131238.git.vilhelm.gray@gmail.com>
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
 o.rempel@pengutronix.de, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 10/22] counter: Standardize to ERANGE
 for limit exceeded errors
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
> ERANGE is a semantically better error code to return when an argument
> value falls outside the supported limit range of a device.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

(I agree with William's assessment that this use of ERANGE
is consistent with other uses in the kernel.)


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
