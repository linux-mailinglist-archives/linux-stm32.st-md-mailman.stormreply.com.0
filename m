Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8535DA68CDC
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 13:30:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 476F9C78F60;
	Wed, 19 Mar 2025 12:30:27 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6186EC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 12:30:25 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250319123022epoutp03139874adf5f6e113f050c5a1985f595b~uNCED9FQw0051700517epoutp034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 12:30:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250319123022epoutp03139874adf5f6e113f050c5a1985f595b~uNCED9FQw0051700517epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1742387422;
 bh=gD9Sr1WH7oBqjVnHxW56qgptKH/950gTsxbz1DfjlQM=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Rl8aOkvn+agBf3Si2cNbj5uHQltdw+RkuuilkWCOLKgzu0+wiMeYmGT2054frQc3I
 RyxJJpO3r242d46ePvwt2XhSxU0wJ15iF3Qa4ql7GdQ7Y4Aem3hdNiH8Zf89vc/JPB
 RQ4nvBjRm06gDvTCcir3UkKhr1tSmgIiDjchDA1o=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20250319123021epcas5p25c3c94b54fe3fbc4768f981d3fcfa202~uNCDb804K0839608396epcas5p2i;
 Wed, 19 Mar 2025 12:30:21 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4ZHp2M4snMz4x9Q0; Wed, 19 Mar
 2025 12:30:19 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.BA.19956.BD8BAD76; Wed, 19 Mar 2025 21:30:19 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250318105612epcas5p34f450be02cce619b638594c488b31440~t4Gkce5Ye2841228412epcas5p3h;
 Tue, 18 Mar 2025 10:56:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250318105612epsmtrp2c35a86035ab44ea22c50ce1c1a785518~t4GkbagS_0212302123epsmtrp2h;
 Tue, 18 Mar 2025 10:56:12 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-29-67dab8db51ef
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 05.F2.18729.C4159D76; Tue, 18 Mar 2025 19:56:12 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250318105610epsmtip2063c82de3e89d1e8ad55f420d5c19370~t4Ghvs-CR2200322003epsmtip21;
 Tue, 18 Mar 2025 10:56:09 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>
In-Reply-To: <Z9HK2de5Ba_Vbeo7@shell.armlinux.org.uk>
Date: Tue, 18 Mar 2025 16:26:03 +0530
Message-ID: <000501db97f4$5cf4e7d0$16deb770$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHcwqSBZNYxUrKMqce/4F1P5N/GfgHDYTN3Am9yBUoC+lQhMgFBTkwbszLu+LA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc99r+x5sZc+C84IZK4/YCBNstS2P8UMXDT7ULETisvHHoIG3
 QoC2a4tTF4VkjA0myFCcNh02ihLKAC0/Wn4OK6AowpAJOIJzrPywTHBicMhwa32w8d/nnPM9
 95zvvbk4Klji+eFpKj2jVSkySJ4np/F6UHDIqO0XpdhaTlKLj84AquKhjUv90NaHUMb+XA51
 vrOPS010j2PU/Y4mhHpkeMCjfmos4lKW34e41GCzkUcVDDm4lL20DVBly9Vcqtv0JrVw+w9A
 XWh4hlG/PWnFqM7eaZT6p9WG7fShB4cGULq+8j5CT5xswOgmwxhGmyxZtMWcz6PryrPpJts8
 Qs+13+PRRfVmQF9rl9DzFv+41xPSI1MZRQqjFTKqZHVKmkoZRe6LT9yVKJOLJSGScCqMFKoU
 mUwUuXt/XEhMWobLJik8pMjIcqXiFDoduTU6UqvO0jPCVLVOH0UympQMjVQTqlNk6rJUylAV
 o39XIhZvk7mESempk19+hWoG1x3OtzuxHDDhVQA8cEhIYelwLigAnriAaAHwUp8VYYOnADaX
 PV+pLADYX+fgrrbctBeibKENwLlTTh4bTANYYzEjbhWPCIYXitoxN/sQYbA0v5PrFqFECQee
 bZh0iXDcg5DBmVGpG72JGJhzQ+aWc4hNMP+8HbiZT4TDvDMzGMvrYM85B8fNKPE2tD42ouxC
 Qrg4cZnLjnofzk+9BKxmA+xaPPFqUUhUeMDK7hrANuyGxS+qeSx7Q+eNeoxlPzg/27aSp+G5
 2sIVxylwxtzHYXkH7PjZyHHvjBJBsLZ5K5t+C5beqkHYuV6wcMmBsHk+tJWtciBcnhlaOcYX
 Nl6aw4oBaVhjzbDGmmGNBcP/00yAYwa+jEaXqWR0Ms12FfPZfw+erM60gFe/IHifDYw/fBJq
 BwgO7ADiKOnD3+MYVgr4KYojRxmtOlGblcHo7EDmuu9vUb/1yWrXN1LpEyXScLFULpdLw7fL
 JeQG/hdNuUoBoVTomXSG0TDa1T4E9/DLQY7cDX72NOD7CH+z7bhNJGy5GLvxbLTeVl7vrDXP
 NKZl41hOVMHzvM6gb0r2+277a/xjkffsDmvt+GtdS95/xm96J6Bjsa5owMea177x6suxN/Z8
 nuBf4fwaHs5Prcu++XhLZWdC8e2hqRr8pD2xJ1B066DJcefAdNVevtD+4KNfBQM7q5J+/OC6
 9zAxOFJ/dUt1aezxgMrN3yEfjsUffa9/tDdSc0zeNLDstX6Xcyq5xRR9yDR/z9jVupcYLB8x
 GIkFVYm5ree05xSWlHA59KLg1Kc11gjQHDYe4REb5+xVk7E+1/7uq3gRE6i8M7v5bpUoSa4T
 jxz7ZPLKAU1PUpDoRLeI5OhSFZJgVKtT/AteSFcxjgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7bCSvK5P4M10g4V/9Cx+vpzGaLH8wQ5W
 izV7zzFZzDnfwmIx/8g5Vounxx6xW9w8sJPJ4uWse2wWF7b1sVpsenyN1eLyrjlsFl3XnrBa
 HJq6l9Fi3t+1rBbHFohZfDv9htFi0dYv7BYPP+xhtzhy5gWzxf89O9gdRDwuX7vI7LFl5U0m
 j6f9W9k9ds66y+6xYFOpx6ZVnWwem5fUe+zc8ZnJ4/2+q2wefVtWMXoc3Gfo8XmTXABPFJdN
 SmpOZllqkb5dAlfGs9Z25oLLghWdh16xNzA+5eti5OSQEDCROHGol7mLkYtDSGA3o8StA9uY
 IBKSEp+ap7JC2MISK/89Z4coesYocWP5AnaQBJuAlsSivn1gtoiAucTUziOsIEXMAitYJG7s
 u8MC0dHPJLFg9n8gh4ODU8BU4vVtExBTWMBNouG4KUgvi4CqROf8Q4wgNq+ApUTbtNfsELag
 xMmZT8A6mQX0JNo2gpUwC8hLbH87hxniNgWJn0+XsUKc4Cfx+fk/qBpxiaM/e5gnMArPQjJp
 FsKkWUgmzULSsYCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnAq0NLcwbh91Qe9
 Q4xMHIyHGCU4mJVEeN2fXE8X4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1
 ILUIJsvEwSnVwFR25dTS28tUUq9dnLtJWy9ukdc75eBjmvc2Tem1l6p+vJR98do57s9u3txj
 UXiwSOz25dBVHA0f66M/KIVPb9kfcPjQgSlMfXylyz5wMdx/aKy6aK2IsdoUifl1pw8kC93Y
 8eHv6U93uhZY7jw9XSA7xGNxlMj1t5NYLjyayTCvPvRK2J5TH59PUDzSvcqx88uO6F3nN8yx
 11x806HlxcTrsXY/0rzYvk+ZupPpjGKWsPXzySvWVyyeov/eqbVPQM/QmGXjqgifI++O2+pW
 T7ygmbFSdL5nqDLj0Y3ddTc6pDoTPm64HNhmW2NxcK7eDO53J22knNZceOKmmzpLz7VENIr3
 e4s+04VC0dhmvYj/SizFGYmGWsxFxYkAXY4muHQDAAA=
X-CMS-MailID: 20250318105612epcas5p34f450be02cce619b638594c488b31440
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd
References: <20250305091246.106626-1-swathi.ks@samsung.com>
 <CGME20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd@epcas5p4.samsung.com>
 <20250305091246.106626-3-swathi.ks@samsung.com>
 <Z8hjKI1ZqU19nrTP@shell.armlinux.org.uk>
 <Z9HK2de5Ba_Vbeo7@shell.armlinux.org.uk>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 ravi.patel@samsung.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, pankaj.dubey@samsung.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 2/2] net: stmmac: dwc-qos: Add FSD EQoS
	support
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



> -----Original Message-----
> From: Russell King (Oracle) <linux@armlinux.org.uk>
> Sent: 12 March 2025 23:27
> To: Swathi K S <swathi.ks@samsung.com>
> Cc: krzk+dt@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH v8 2/2] net: stmmac: dwc-qos: Add FSD EQoS support
> 
> On Wed, Mar 05, 2025 at 02:43:52PM +0000, Russell King (Oracle) wrote:
> > On Wed, Mar 05, 2025 at 02:42:46PM +0530, Swathi K S wrote:
> > > The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP
> core.
> > > The binding that it uses is slightly different from existing ones
> > > because of the integration (clocks, resets).
> > >
> > > Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> >
> > This looks much better!
> >
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >
> > Thanks!
> 
> Hi Swathi,
> 
> Please can you test with my TX clock gating series applied (
> https://lore.kernel.org/r/Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk ) with
> STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP set as per the attached diff.
> Please let me know whether this passes your testing, so I know whether
this
> platform supports it - please check that this results in a message in the
kernel
> log indicating "tx_clk_stop = 1". Thanks.

Hi Russell, 
Applied your patches and tested. 
It did not cause any functional issue, but at the same time, as EEE is not
enabled in our HW, we cannot really test that particular functionality.

Regards, 
Swathi

> 
> --
> RMK's Patch system: https://protect2.fireeye.com/v1/url?k=23e12f6a-
> 429cc5e9-23e0a425-74fe48600158-954ebfe080aed91e&q=1&e=40e60980-
> bcfe-49e0-a9c9-
> d9b87765f87c&u=https%3A%2F%2Fwww.armlinux.org.uk%2Fdeveloper%2F
> patches%2F
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
