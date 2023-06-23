Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5A73B071
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 07:57:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58D31C65E42;
	Fri, 23 Jun 2023 05:57:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2053AC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 05:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687499840; x=1719035840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y/CKVqWgLHa+Q3CB7q4KwhnuffZiwcoExTpZS7D9MfY=;
 b=UAi1KRxhWNo1DQyc+7g2LyqspcqlNsXRUMt0gni/gnM5lf00dVGAStX6
 g92odn9DY2udsOgOMQU9POTzffDCMOGTlqNMS9LGPTjtPidAKLnrQMt0O
 FmIZJQ7AOBN8RJAyv+jF6xUQxQ9x3UXt4GT9DDfzNuzPOD369l8BLd456
 BloFrwOfcARdTUwjuoY3HeFgNdjPJusNOlu6rVCKLsPl87FbxFsBJLq3e
 OcGZZI8EVbNk0pDhbloGmmoCSvHoC5jbplErXdCKYuNeW1XDy8w80dkIx
 X6uloU9okN+xVWYsVh1kKBCKBRlkWJfBi2cKD4m+kmQMU5dxYP5zRs5n6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358187308"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="358187308"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828252631"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="828252631"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.215.253.116])
 ([10.215.253.116])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:57:07 -0700
Message-ID: <260499f9-4746-d06b-4fac-a01f29365704@linux.intel.com>
Date: Fri, 23 Jun 2023 13:57:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Simon Horman <simon.horman@corigine.com>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
 <20230622041905.629430-4-yong.liang.choong@linux.intel.com>
 <ZJReJ2yxqKGQx1BU@corigine.com>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZJReJ2yxqKGQx1BU@corigine.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Tee Min <tee.min.tan@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: phy: update in-band AN
 mode when changing interface by PHY driver
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

Hi Simon,

I will update it in v2. Thank you.

On 22/6/2023 10:43 pm, Simon Horman wrote:
> On Thu, Jun 22, 2023 at 12:19:02PM +0800, Choong Yong Liang wrote:
>> From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>
>>
>> Add cur_link_an_mode into phy_device struct for PHY drivers to
>> communicate the in-band AN mode setting with phylink framework.
>>
>> As there is a mechanism in PHY drivers to switch the PHY interface
>> between SGMII and 2500BaseX according to link speed. In this case,
>> the in-band AN mode should be switching based on the PHY interface
>> as well, if the PHY interface has been changed/updated by PHY driver.
>>
>> For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
>> back for SGMII mode (10/100/1000Mbps).
>>
>> Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> ...
> 
>> diff --git a/include/linux/phy.h b/include/linux/phy.h
>> index 11c1e91563d4..c685b526e307 100644
>> --- a/include/linux/phy.h
>> +++ b/include/linux/phy.h
>> @@ -756,6 +756,8 @@ struct phy_device {
>>   	/* MACsec management functions */
>>   	const struct macsec_ops *macsec_ops;
>>   #endif
>> +	/* For communicate the AN mode setting with phylink framework. */
>> +	u8 cur_link_an_mode;
>>   };
> 
> Hi Choong Yong Liang,
> 
> Please consider adding cur_link_an_mode to the kernel doc
> for struct phy_device - which is above the definition of struct phy_device.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
