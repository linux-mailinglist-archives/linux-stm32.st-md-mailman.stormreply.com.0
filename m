Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE965F55E
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jan 2023 21:47:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F36A5C69069;
	Thu,  5 Jan 2023 20:47:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0DA3C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jan 2023 20:47:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A7E0D855ED;
 Thu,  5 Jan 2023 21:47:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1672951657;
 bh=YzeimdHMWt2nVwx8dFppUVXQs6aJ/fy+Q8hLm/F25n4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jEEEb2ubfo2YJ6GeqPXd0n2zh2uZAP2rTol74337eMsUsVfo3Xmn0MKWGC8Pr6N7e
 V0GPIGzgVTZO1z+SWGbnM4wOAzO2JF/mEXc9GeRZRrGnaS9JcIxjCn1KKhC/YFWsYY
 +IE2vWfAxOah0Cy5aCucsi4QpuGHcMc2PsFG/eCkIaB2VSIgcFaaMi1ljCF/T6fTov
 cOh+n1ZBIfrSDGEX7vjnFwmWUoaeytEf/TZmy8DEfVuAlVsof5X88AcPXgpBDM4hsn
 IgdL/sGfU8nmU+k15SV77V6voGpgaUmKLxyJFJY3N0UBCM8HfnsAzpkDH2sMb9yr7D
 q/15I1Zoh6w9w==
Message-ID: <212119f9-d59f-76f2-18b7-d6248767ea4a@denx.de>
Date: Thu, 5 Jan 2023 21:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Valentin CARON <valentin.caron@foss.st.com>
References: <20221216115338.7150-1-marex@denx.de>
 <b4e13643-0494-329a-2d41-06da985b9dfe@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b4e13643-0494-329a-2d41-06da985b9dfe@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: Merge hard IRQ and
 threaded IRQ handling into single IRQ handler
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

On 1/5/23 15:56, Valentin CARON wrote:
> Hi Marek,

Hello Valentin,

> It is OK for me.
> 
> Tested-by: Valentin Caron <valentin.caron@foss.st.com>

Thank you. I might need one more test for V4 in a bit.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
