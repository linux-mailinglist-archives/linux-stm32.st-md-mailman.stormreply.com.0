Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADD1D0676
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2020 07:42:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9614C32EA7;
	Wed, 13 May 2020 05:42:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8D76C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 05:42:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04D5gKwG030195; Wed, 13 May 2020 07:42:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=PA4ZXQ0yWBr3TXyuz71Z6yCek2TSTzgnyT8SThVO9WM=;
 b=cBKs8dP3gE1rIUG2bqKcIRQOanm7pzuqyCC4/EqFsjyf8Vc048pCQi0+GyDvyK6rvUaY
 sVOQvIXe/ooRW65Ym3Qk/YUeKI79nY3KGV1L1Qzfd3eKwOfqt/s5Zjyj0t8k0FuiUpzL
 rVa/eo6uT+hrtDkq2ScaPQ0d9hmCfzP8p88T8JADVbdvZF2jWw72lnsjCEwJwd5gQR1f
 ByeJ1zGbZ468urJOvdEW0p8y6VjK0M6HBYHNV2mJr1C5Al+tuAwyclQfiszWgkmIg+Mu
 YyXaGJi1nIMeXPyxdlY9UphXl2Q+TPd+oG42omIeQkyaIbHqE4bLwqGjisEr1CL+re5V 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpam3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 07:42:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7284310002A;
 Wed, 13 May 2020 07:42:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4234721FE90;
 Wed, 13 May 2020 07:42:37 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 13 May
 2020 07:42:36 +0200
Date: Wed, 13 May 2020 07:42:31 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20200513054231.GA16558@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
 "wsa@kernel.org" <wsa@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-4-git-send-email-alain.volmat@st.com>
 <20200513021932.GA9172@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513021932.GA9172@bogus>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_01:2020-05-11,
 2020-05-13 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 "wsa@kernel.org" <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] dt-bindings: i2c-stm32: add SMBus
	Alert bindings
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

Hello Rob,

On Wed, May 13, 2020 at 02:19:32AM +0000, Rob Herring wrote:
> On Tue, May 05, 2020 at 07:51:10AM +0200, Alain Volmat wrote:
> > Add a new binding of the i2c-stm32f7 driver to enable the handling
> > of the SMBUS-Alert
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > index b50a2f420b36..04c0882c3661 100644
> > --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > @@ -36,6 +36,10 @@ allOf:
> >                  minItems: 3
> >                  maxItems: 3
> >  
> > +        st,smbus-alert:
> > +          description: Enable the SMBus Alert feature
> > +          $ref: /schemas/types.yaml#/definitions/flag
> > +
> 
> We already have smbus_alert interrupt. Can't you just check for this in 
> the slave nodes and enable if found?

My understanding reading the code (smbalert_probe within i2c-smbus.c, of_i2c_setup_smbus_alert called when
registering an adapter within i2c-core-smbus.c) is that smbus_alert refers to an interrupt on the
adapter side. That is an interrupt that would be triggered when the adapter is receiving an smbus_alert
message.
In our case (stm32f7), we do not have specific interrupt for that purpose. The interrupt triggered when
an SMBUS Alert is received (by the adapter) is the same interrupt as for other reasons and we check
within the irq handler within stm32f7 the reason before calling i2c_handle_smbus_alert if the status
register indicated an SMBUS Alert.
So my understanding is that we cannot rely on the mechanism of naming an interrupt smbus_alert.
Did I misunderstood something ?

> 
> >    - if:
> >        properties:
> >          compatible:
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
