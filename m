Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76FCDC30
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 09:06:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47D28C36B0C;
	Mon,  7 Oct 2019 07:06:45 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE723C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EB7HgQCd6wfHbcV/vGVRoCbCpG0HC8nsMy/oBEd1URQ=; b=0vzoW+jm1B3XKAvl9MDT9KBTt1
 owxlfy79uyVQco2v1xHDwo2GTYPtMx6pjhSOHOZ2DTJKlPLjeENuHuf4YdspzMtk+2fa9NHlMTAnW
 9Vmmjy8osDo/GebfC0UPRe0Ng4+khLlB+0LMOIepWaX9ERQ7dYoDtZ1Wc6FMHlpj4dTVpL6cx417R
 8NbK693FPbVQQ3YpUElxr5utVk26R+TDXWO5BY7rbXHmpfYMpJlZkL/DwBdZdbroAemDDl+MxAdMJ
 sn5KtiK8VZ2P+HBOLT4q2Sc37Lo5+WJBCJohH88UBclmAYSQQnPfPhQUzmNhxeeSAfVGIB8IyNUIo
 tw4Kut6A==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:54518 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1iHBQR-0001Yn-Dn; Sun, 06 Oct 2019 14:38:35 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1570377521.git.vilhelm.gray@gmail.com>
 <7c129bd95675412e21c7a54e366e21723cac94ea.1570377521.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <110c2460-f440-e36d-7975-61c53a94208d@lechnology.com>
Date: Sun, 6 Oct 2019 13:38:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7c129bd95675412e21c7a54e366e21723cac94ea.1570377521.git.vilhelm.gray@gmail.com>
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
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:06:44 +0000
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] counter: Simplify the count_read
 and count_write callbacks
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

On 10/6/19 11:03 AM, William Breathitt Gray wrote:
> The count_read and count_write callbacks are simplified to pass val as
> unsigned long rather than as an opaque data structure. The opaque
> counter_count_read_value and counter_count_write_value structures,
> counter_count_value_type enum, and relevant counter_count_read_value_set
> and counter_count_write_value_get functions, are removed as they are no
> longer used.
> 
> Cc: David Lechner <david@lechnology.com>
> Cc: Patrick Havelange <patrick.havelange@essensium.com>
> Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---

Acked-by: David Lechner <david@lechnology.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
