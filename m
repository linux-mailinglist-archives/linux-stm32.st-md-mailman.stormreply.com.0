Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D73041E1FE3
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 12:39:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80538C36B23;
	Tue, 26 May 2020 10:39:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7634C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 10:39:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QAc29I022072; Tue, 26 May 2020 12:39:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=C8k53DjjYyfSex56lDdOYubcmmBBqtjkh1SjIKFK07M=;
 b=TJa7J+KAtCbOnxiZK8u+N6QqtUgLtfQvtNkevPschMh1XJjFhH8jP552iBQXXguttwQh
 z3w80ac8qN4sp+TpakM9FxdyUhhRplARc6bqFemUdyeet+YozLGN+j6fLWSjU1zjLybG
 TI+GIi4nfOW98MmUuiLAwIZI9dwUTAQf5fRzNfMhqezE6D9U5tpJjdihzwQ8HkA3+e5y
 dqmtRyZKYc2eJ+7ehnq1PVI/44JJhoaIt4Iuqd5HSrWOISTNrDI5bAtEzrDpXAD+eyps
 FX3ZiJqBU16syzJTWse7QPXLIZGe/UDh6Xgq6GGy5SqQ802IJN07pc5bhY0nhR/lop5O Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316skw75hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 12:39:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FD7710002A;
 Tue, 26 May 2020 12:39:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 399452A705A;
 Tue, 26 May 2020 12:39:40 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 26 May
 2020 12:39:39 +0200
Date: Tue, 26 May 2020 12:39:38 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Wolfram Sang <wsa@kernel.org>
Message-ID: <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 robh+dt@kernel.org, mark.rutland@arm.com,
 pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
 <20200523110140.GD3459@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200523110140.GD3459@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_01:2020-05-26,
 2020-05-26 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] i2c: stm32f7: Add SMBus-specific
	protocols support
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

On Sat, May 23, 2020 at 01:01:40PM +0200, Wolfram Sang wrote:
> 
> > +static int stm32f7_i2c_reg_client(struct i2c_client *client)
> > +{
> > +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(client->adapter);
> > +	int ret;
> > +
> > +	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
> > +		/* Only enable on the first device registration */
> > +		if (atomic_inc_return(&i2c_dev->host_notify_cnt) == 1) {
> > +			ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
> > +			if (ret) {
> > +				dev_err(i2c_dev->dev,
> > +					"failed to enable SMBus host notify (%d)\n",
> > +					ret);
> > +				return ret;
> > +			}
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> 
> So, as mentioned in the other review, I'd like to evaluate other
> possibilities for the above:
> 
> - One option is to enable it globally in probe(). Then you lose the
>   possibility to have a device at address 0x08.

I'd prefer avoid this solution to not lose the address 0x08.

> - Enable it in probe() only if there is a generic binding "host-notify".

Do you mean having the adapter walk through childs node and see if at least
one of them have the host-notify property ? This mean that such solution
wouldn't work for device relying on platform data rather than DT nodes.

> - Let the core scan for a device with HOST_NOTIFY when registering an
>   adapter and then call back into the driver somehow?

You mean at adapter registration time only ? Not device probing time ?
At probing time, we could have the core (i2c_device_probe) check for the flag
HOST_NOTIFY and if setted call a dedicated host-notify reg callback ?

> 
> Other ideas?
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
