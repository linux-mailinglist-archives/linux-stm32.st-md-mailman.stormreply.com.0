Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E661C336C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 May 2020 09:14:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64403C36B29;
	Mon,  4 May 2020 07:14:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E12FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2020 05:46:22 +0000 (UTC)
IronPort-SDR: dVDaR/++7o8ZyqaMUX0Pifb3RKtgkl3Blq9YQtanYZZpU8opj9GfCSFLLldxllpsZhb+fXOLFm
 HQhhJDF37QDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 22:46:20 -0700
IronPort-SDR: TXvKDZUMGElupqRIHsEDPTP3SAOJqu/4Te3id4ZK9HdrJQLpbjoszE0PQZf2gLedKfVr3+DDuR
 77c9leqmWWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="433989799"
Received: from mylly.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
 by orsmga005.jf.intel.com with ESMTP; 03 May 2020 22:46:16 -0700
To: Wolfram Sang <wsa@the-dreams.de>, Alain Volmat <alain.volmat@st.com>
References: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
 <20200430163503.GA15047@ninjato>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <0a0b4ad7-3c5a-075d-1484-1e95b976ff48@linux.intel.com>
Date: Mon, 4 May 2020 08:46:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430163503.GA15047@ninjato>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 May 2020 07:14:44 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: fix missing pm_runtime_put_sync in
	i2c_device_probe
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

On 4/30/20 7:35 PM, Wolfram Sang wrote:
> On Thu, Apr 30, 2020 at 05:43:21PM +0200, Alain Volmat wrote:
>> In case of the I2C client exposes the flag I2C_CLIENT_HOST_NOTIFY,
>> pm_runtime_get_sync is called in order to always keep active the
>> adapter. However later on, pm_runtime_put_sync is never called
>> within the function in case of an error. This commit add this
>> error handling.
>>
>> Fixes: 72bfcee11cf8 ("i2c: Prevent runtime suspend of adapter when Host Notify is required")
> 
Right, I was blind to see this.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
