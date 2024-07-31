Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C603C94257F
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2024 06:40:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 676EAC6DD66;
	Wed, 31 Jul 2024 04:40:00 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B4EAC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 04:39:52 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240731043949epoutp01a596dfcc44cbb14813287938b6ac6343~nMmR29tAK0884908849epoutp01J
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 04:39:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240731043949epoutp01a596dfcc44cbb14813287938b6ac6343~nMmR29tAK0884908849epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1722400789;
 bh=Dd63mNaPxtLMVJfZDMDWX7UkNnRiEbWaN0qFM5W5oFA=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=bN49G+0hekrZKkMnJT1IU8xNYIB912YcGoagZAYhVIraQ0vwOPYSm9Kbwu8fRoRQD
 k4shhq1m3npZ+Uv51xsUgkuSJoHXTTHn10gLub717goKCowP6eE0Iz+aR3F3oCp4fR
 X+7AEIOA80dRdbeG/mEsMvMNZ4KjBhvRrIOdtCXs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240731043949epcas5p1faccfabe036719ee6bb761783f735d66~nMmRVo8aW0659306593epcas5p1I;
 Wed, 31 Jul 2024 04:39:49 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4WYfX30Wg1z4x9Pw; Wed, 31 Jul
 2024 04:39:47 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EE.BF.09642.210C9A66; Wed, 31 Jul 2024 13:39:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240731043843epcas5p3b75f1cc1f217b45a1a657c6297c70444~nMlUqtsdB1519615196epcas5p3z;
 Wed, 31 Jul 2024 04:38:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240731043843epsmtrp2cd1be8f43e24b6306309646378c586f0~nMlUpZgJ-3231332313epsmtrp2R;
 Wed, 31 Jul 2024 04:38:43 +0000 (GMT)
X-AuditID: b6c32a4b-613ff700000025aa-24-66a9c012f875
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.68.08456.3DFB9A66; Wed, 31 Jul 2024 13:38:43 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20240731043840epsmtip16061e61716d660e324581f85ce744dab~nMlREnb7C0070600706epsmtip1j;
 Wed, 31 Jul 2024 04:38:39 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Andrew Lunn'" <andrew@lunn.ch>
In-Reply-To: <18b83c34-c0e4-466c-aaa1-fff38c507e9a@lunn.ch>
Date: Wed, 31 Jul 2024 10:08:38 +0530
Message-ID: <00b201dae303$85f58c80$91e0a580$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQD2Gw94KDf30OIcDBeWExyH9iGvOgIzKibnAjAKSeACgQQzirOirpLQ
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xbVRzHPX3dgnZeCpMDhtlcMAwyHh2PnfKYcy7sIpIwzWLEP0pHL49B
 H+lDJ8E4p4DCBAm4QQWsyHBUXquUNwUq6zYglGUDQxwbY5BtvCNIYIQh5TLlv8/55vt7nvy4
 TP4vmDs3Va6hVHJJOsFxZDX/4ePtx++pSQocaxSh9aeXAJqoaOYg27iFiWq7hhiozPY1C/3U
 N8RG09ZJDI31tDFQX38VA92vXGAjm60RQ8PN+WxkfDTKRg9nPkR32ss4qMRmZqDc0Sk2qtis
 YyOr/jW0OjAHUKVpBUNbsyaAHi51Ykg33MpGfYNPmGirsxVDlRN69rHXyaaaMQY5XWDCyDbd
 OEbqjVrSaPiWQ/5e9QXZ1rrMIBfNIxwyv8kAyF6zkJxe62KSTd3LgHx+oRwjl40H4vbFp0Wk
 UBIppRJQ8kSFNFWeHEnEfCB+RxwSGij0E4rQEUIgl8ioSOLEe3F+Uanp2yshBJ9I0rXbUpxE
 rSYCjkaoFFoNJUhRqDWRBKWUpiuDlf5qiUytlSf7yylNmDAw8HDItjEhLUU/sokpx189p79R
 yDgPcnm5wIEL8WBoy7nNsDMf7wCwYfAAzX8DWFLzEc2rAK78KssF3B3/zyPRucBxW+4CsKiw
 jkM/ngBY++Ma0x7AwX1hZb4Zs7ML7gUryot3CjDxITbMG8btiRzwcJhVEmCXnfEoaGqu37Gw
 8DfhA+Mo2848XASf/fMlRrMTvFU6xaLTvAFb5suYdP8CuD5dzaZLRcFrbZsY7XGF19cvMu29
 QXzGAV7emGDRASfgowILoNkZztxowmh2h8sLXRyaxfC3/JFdfwocf1a4q78Fe+6Wsez9M3Ef
 2NAeQMse8If++t0R98HvNqYYtM6DrRUv2BNuzo7upnSDzVcWse8Bodszmm7PaLo9I+j+r6YH
 LANwo5RqWTKlDlEGyalP//vsRIXMCHauxTemFUxOLPlbAIMLLABymYQLT3z3ShKfJ5V8lkGp
 FGKVNp1SW0DI9r4Lme77ExXb5ybXiIXBosDg0NDQYFFQqJBw5c1mlUv5eLJEQ6VRlJJSvYhj
 cB3czzMO3smyEgWPIdmnKvIvvYof7DBYPXm9T22SAZ8lR+9jAsKlqrt4ZXiq+lD46MuZVH/l
 aXNpjaUK9bRr82Dt3Jm/tB3gOntecen4PeKUKVYRK41atQy2vM97XCQcOb46JJ49CRY6o87E
 ul1LqvMMCuOcatsfPbb1/OOWgRwBS3TTIxrGhN3O+2o2s89QHbdRvBZ0cbrSVf5KMStNdShp
 OXTuZu2Dc2etMg9iRqo77eU0J3t3yTzfrQmybv45fDSMH/HN5fD4W0cMI6miCbOp3jsp820v
 IiXj8+yGBK6vwSnSOnlf8dLVjPicC2ep3sZsJ+XJw8X3ErTZiwlrzt2rfIKlTpEIfZkqteRf
 mJyrCbYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVCMeRz3e172eVq3PLZGPxqLvYyxzZWcZn5ozMXIwzA690emOWXVo5q2
 l9ltJeNOXF5aRCTZqbVtueyel6xau9fWUtkotQzlYmKjULIiGp3ZsO0Y/feZ7+f1jy+NC4+Q
 M+nktExOniaViXl8wtQoFv10z6bftrDZsACN9hcB5NSYeMjR3YCj83XtGCpx5BLoTFM7ifrs
 TynUdc2CoaaWCgw91rlI5HBUUeiOKZ9ExmedJOoZiEb3/i3hoWJHPYZUnb0k0rgvkMiunY5G
 WgcB0tW8p9DnVzUA9QxZKaS+YyZR0+2XOPpsNVNI59SSvwSw1foujO07WkOxFnU3xWqNStZo
 yOOxVyp2sxbzMMa+qe/gsfnVBsBerw9l+z7W4Wy1bRiwY3tLKXbYKIqaEsMPT+Bkyds5ecjy
 LfwkbYebyuieukPbXIDlAJVABWgaMothWccaFeDTQqYWwMMPrgMV8Pl6nwHf/XWS9GJfqB97
 QXlFzwF8dL8f8xA8RgJ1+fWUB/sxgVBTWoh5RDgzQEJnayHhdQwAaDcP8Dx1PswyuK84xGPw
 ZSJhjenieBDBzINPjJ3jbQJmCfz/wx7Ki6fBW6d7CY8VZ4Lh/svj43BmNrz6ugT3jpsDR/v+
 Jr0bIuFli5vyavzhjdHD+DHgq56QpP6epJ6QpJ7g0ALCAGZwGYrUxFRFaMaiNC4rWCFNVSjT
 EoPj01ONYPxjJBIzsBqGghsARoMGAGlc7CeIu392m1CQIM3eycnT4+RKGadoAAE0IfYXjLw6
 kiBkEqWZXArHZXDybyxG+8zMwZInleX93FJ7bF/4SAVb4Kp++DbsfLFonu9dZWlUheuJ0NY2
 FiZpxUMO3pxlOx6/xmlfqa39QSrLDKoqvC0e8q/skgy2feCeNcZFpETaRaaNsS/XYa7VfOm1
 nHPpsbvObC6vzDyJ5q4tYKZtOKCx5PYooxe/ieGI1+9vXpz+36nwKlHViuZZQfarzoXDc5c1
 GiImL7VufhFU+eMccXSziPzHNXXr4KYTPS1HC3qTUooOfcqJ0UWsny/bYrDu+jVWT30Ua9y2
 P4UGfO/8P8gHgW2X/EqZ6AS0akpT3aZAd3ZeVtLvgY+EYab0mPbc/nL9b7vzYgNUZQ9JdOFc
 /JK6LHdRtphQJElDJbhcIf0C6Y5GCqADAAA=
X-CMS-MailID: 20240731043843epcas5p3b75f1cc1f217b45a1a657c6297c70444
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730092902epcas5p1520f9cac624dad29f74a92ed4c559b25
References: <20240730091648.72322-1-swathi.ks@samsung.com>
 <CGME20240730092902epcas5p1520f9cac624dad29f74a92ed4c559b25@epcas5p1.samsung.com>
 <20240730091648.72322-3-swathi.ks@samsung.com>
 <18b83c34-c0e4-466c-aaa1-fff38c507e9a@lunn.ch>
Cc: jayati.sahu@samsung.com, edumazet@google.com, linux-fsd@tesla.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com,
 pankaj.dubey@samsung.com, krzk@kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ravi.patel@samsung.com, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 rcsekar@samsung.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 2/4] net: stmmac: dwc-qos: Add FSD EQoS
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
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 31 July 2024 01:44
> To: Swathi K S <swathi.ks@samsung.com>
> Cc: krzk@kernel.org; robh@kernel.org; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alim.akhtar@samsung.com; linux-
> fsd@tesla.com; netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-
> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> alexandre.torgue@foss.st.com; peppe.cavallaro@st.com;
> joabreu@synopsys.com; rcsekar@samsung.com; ssiddha@tesla.com;
> jayati.sahu@samsung.com; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH v4 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
> 
> > +static int dwc_eqos_rxmux_setup(void *priv, bool external) {
> > +	int i = 0;
> > +	struct fsd_eqos_plat_data *plat = priv;
> > +	struct clk *rx1 = NULL;
> > +	struct clk *rx2 = NULL;
> > +	struct clk *rx3 = NULL;
> 
> Reverse Christmas tree please.

Thanks for review.
We will take care in next patch version after waiting for other review
comments.

> 
> > @@ -264,6 +264,7 @@ struct plat_stmmacenet_data {
> >  	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
> >  	int (*init)(struct platform_device *pdev, void *priv);
> >  	void (*exit)(struct platform_device *pdev, void *priv);
> > +	int (*rxmux_setup)(void *priv, bool external);
> >  	struct mac_device_info *(*setup)(void *priv);
> >  	int (*clks_config)(void *priv, bool enabled);
> >  	int (*crosststamp)(ktime_t *device, struct system_counterval_t
> > *system,
> 
> It would be good if one of the stmmas Maintainers looked at this. There
are
> already a lot of function pointers here, we should not be added another
one if
> one of the exiting ones could be used.
> 
>     Andrew
> 
> ---
> pw-bot: cr


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
