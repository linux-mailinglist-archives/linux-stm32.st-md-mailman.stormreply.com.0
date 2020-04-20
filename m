Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4E1B0F1D
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 17:00:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA4DC36B0C;
	Mon, 20 Apr 2020 15:00:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5040EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 15:00:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KEwrKp027524; Mon, 20 Apr 2020 17:00:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=LFbHXDYgAgs4Hcvg9/e01AWVNn3apQsBjy+Cy3nDA1c=;
 b=lQQHFOMVMl7wYS2G9F1hLw0BI8eTx7z/+q3B3DFceEmfVXoYNKCRiGz/g/s7PYkAhuNq
 /Dv+nZY5so2PnL6/7aTWG6oxfcEEE8kPCtRe2SrwAKWkN66hWunDWk/yyI76EkTuQFcw
 Y8sACQw6lSJFXf8BCMP6/ERG57Bo59GOGXrHJZMe7oALD7p7K4CgSRUUa5l6W+G6cdZg
 3nCe5DZGqLokDoxzaMBIV6QNHgszki0ZtXt65SluBOoaYVzXveUgRfyMTvGm9vM7XaUt
 BJjvn/VjhAoiTPWDK5acwgfEH0HT6B0khFYHu29sxxdWoi3MTmLuVoi41iXH5ThwjcAt gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw2vn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 17:00:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2EB610002A;
 Mon, 20 Apr 2020 17:00:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B52292AA282;
 Mon, 20 Apr 2020 17:00:34 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr
 2020 17:00:34 +0200
Date: Mon, 20 Apr 2020 17:00:29 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Wolfram Sang <wsa@the-dreams.de>
Message-ID: <20200420150029.GA6945@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-3-git-send-email-alain.volmat@st.com>
 <20200415110916.GO1141@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415110916.GO1141@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_05:2020-04-20,
 2020-04-20 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] i2c: i2c-stm32f7: allows for any
	bus frequency
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

Hi Wolfram,

On Wed, Apr 15, 2020 at 01:09:16PM +0200, Wolfram Sang wrote:
> Hi Alain,
> 
> On Thu, Mar 26, 2020 at 01:44:21PM +0100, Alain Volmat wrote:
> > Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> > instead allows any frequency (if it matches timing requirements).
> > Depending on the requested frequency, use the spec data from either
> > Standard, Fast or Fast Plus mode.
> > 
> > Hardcoding of min/max bus frequencies is removed and is instead computed.
> > 
> > The driver do not use anymore speed identifier but instead handle
> > directly the frequency and figure out the spec data (necessary
> > for the computation of the timing register) based on the frequency.
> 
> Useful improvement!
> 
> > +static struct stm32f7_i2c_spec *get_specs(u32 rate)
> 
> This is quite a generic namespace. Can we prefix stm32f7_<sth> here?

Done in v3

> 
> > +		if (rate <= i2c_specs[i].rate)
> > +			return &i2c_specs[i];
> 
> Same for i2c_specs here?

Done in v3

> 
> > +static u32 get_lower_rate(u32 rate)
> 
> Here, too.

Done in v3
> 
> Rest looks good to me.
> 
> Regards,
> 
>    Wolfram
> 

Regards,
Alain


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
