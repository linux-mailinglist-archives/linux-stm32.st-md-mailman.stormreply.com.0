Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 576BFA39273
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 06:14:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E22FCC78F87;
	Tue, 18 Feb 2025 05:14:27 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C48C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 05:14:20 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250218051417epoutp04d2d1249a9369e52d0194bffe7b5b88f8~lNYCqsMfM2380323803epoutp04E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 05:14:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250218051417epoutp04d2d1249a9369e52d0194bffe7b5b88f8~lNYCqsMfM2380323803epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739855657;
 bh=p9TjVATQJ+VnRioxoU2Dp5yamug+dRBPU+0D6cLYC2Y=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=O1OmSidaueXtwowa1xF/cFP9PqU4bARLZXXGfiqAdQcy6utuavmhMTFAqAcmBS6z2
 SY6m1DKWOY85swq2QlsebC4R39F/e4Wa5h2F2n1C9CtgyRRrgOJSbzF1pt3Y9sQeRz
 3waHgStEGsBzom0Kqu4XKbi3nw1vTPEY7z1DtuGg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250218051417epcas5p445bc19aa4bf59eeb56c0d7b63f940742~lNYCGTc3V3054330543epcas5p42;
 Tue, 18 Feb 2025 05:14:17 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Yxnkb164tz4x9QG; Tue, 18 Feb
 2025 05:14:15 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B6.C5.19956.72714B76; Tue, 18 Feb 2025 14:14:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250218035521epcas5p26e1a209f2c2e7ab1a3647c92a8b80923~lMTH7mDnE1309513095epcas5p2W;
 Tue, 18 Feb 2025 03:55:21 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250218035521epsmtrp2d0c1d66c7f5fd524c35480f8738994c5~lMTH6Nyor0419904199epsmtrp2R;
 Tue, 18 Feb 2025 03:55:21 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-c9-67b41727575f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 56.65.33707.9A404B76; Tue, 18 Feb 2025 12:55:21 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250218035518epsmtip1336114b755255f30d7612582e4870568~lMTFPqGa01544215442epsmtip1C;
 Tue, 18 Feb 2025 03:55:18 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Andrew Lunn'" <andrew@lunn.ch>
In-Reply-To: <18746e2f-4124-4f85-97d2-a040b78b4b34@lunn.ch>
Date: Tue, 18 Feb 2025 09:25:08 +0530
Message-ID: <015601db81b8$ee7237f0$cb56a7d0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFMfZy5LnHh86L+CikZ+hKlrx3PbgHP/Q5uAh59lGQCP3Rr5gHaDzZ5Aa7CoQMBhZsMSAJJpHR7s/5FypA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNJsWRmVeSWpSXmKPExsWy7bCmhq66+JZ0g7VHWC1+vpzGaLH8wQ5W
 i/N3DzFbrNl7jslizvkWFov5R86xWjw99ojd4uWse2wWF7b1sVpsenyN1eLyrjlsFl3XnrBa
 zPu7ltXi2AIxi2+n3zBaLNr6hd3i4Yc97BZHzrxgtrjUP5HJ4v+eHewOIh6Xr11k9tiy8iaT
 x9P+reweO2fdZfdYsKnUY9OqTjaPzUvqPXbu+Mzk8X7fVTaPvi2rGD0O7jP0+LxJLoAnKtsm
 IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hNJYWyxJxS
 oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5eaomVoYGBkSlQYUJ2xtR3
 RxkLbolWXDq7ma2BsVewi5GTQ0LARGLG5BbmLkYuDiGB3YwS3bdPMUI4nxglnh/7woLgHL8O
 lOEAa/n0lAkivpNRom3JMijnBaPE8u//WEDmsgloSSzq28cOYosIqEjMmzsFrIhZYCWLxOXr
 K1lBEpwC1hJXVixhA5kqLBAo0XaUDyTMIqAqceDMP7ASXgFLic41D5ggbEGJkzOfgM1nFpCX
 2P52DjPEDwoSP58uY4XYlSTRPPM+M0SNuMTRnz1gv0kILOaUuNh8hAmiwUWip+cJG4QtLPHq
 +BZ2CFtK4vO7vVDxeInVfVdZIOwMibu/JkLF7SUOXJnDAnIzs4CmxPpd+hBhWYmpp9YxQezl
 k+j9/QRqFa/EjnkwtrLE39fXoEZKSmxb+p59AqPSLCSvzULy2iwkL8xC2LaAkWUVo2RqQXFu
 emqxaYFxXmo5PMKT83M3MYJzgZb3DsZHDz7oHWJk4mA8xCjBwawkwnuoa0O6EG9KYmVValF+
 fFFpTmrxIUZTYHhPZJYSTc4HZqO8knhDE0sDEzMzMxNLYzNDJXHe5p0t6UIC6YklqdmpqQWp
 RTB9TBycUg1Mt5807JiltG2z+Z0Ztg5BbBcSA5SnrE7j2l1a/Ol6urDX7g/Rx7ZrX5obECrG
 tEs5PdDSPo/7qNTRRWnHOq5ud7edt+l39MOmpcYf5K+uKarpK2apfcHqeMx26pIujSB7scjO
 FXZ1paUZLYsvPmYMl7vJzN9kLtwtY9KsfF9u/X/RTW4/WJ7kXd29cbbfzyeHRZvsnYVE5h7s
 ld6l8fS+uE2x3yTWZ/wnX/NuvFDPL/34cv3k1zkn1v0qv/FgdnC7MrdK1A+FqJuv7A69mBl7
 9U7IXcXySWIn/TYXHJl79oSCkF7Mymv5ujLfz05beCM4+vbzZT1bm4/vuTf3/rRrh3/YSe6Z
 ZrOeK/r8tJTzLEosxRmJhlrMRcWJABQwCA+OBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTURzGOe9lezdavN7a8YLVyoJVK8vglCHVh3gpqFAKutqmr1N0OjYn
 FYSGljnLjLLLWibD0pmazeUtm7WmZF6XZRcyLTUtTMV1YZCrthH57cc5v+fh+fCncN8BIohK
 Sk1nVanSFBGHT9Q9EYWuMhJm+RpXexhyfr4MUNlQA4l6Bqw4qnzYjSF9Tw6Bbtq6STTa9pGL
 Puvec1BvXQGJTMP9JOpr0nOQtn+ERMWzVSRqK1mAfnRMAGS4/42LPkw3c5GtcxxHz89fwNDv
 5gbuZn+mr9+OM2bjG4wZPX+fyzTqBrhMiUnDmCryOExtaSbT2ODAmCnLSw5TYK4AzGNLOOMw
 he6et5+/KZ5NScpgVaujjvATiyZbgfJtwNHnXbWcLHDORwsoCtIRcGYU0wIe5UvXA9g2luhm
 SAfCmewi0st+0Oga42oB/6/zCcBuh8sT4NBiaCiwcN3sTy+FxTcuYW4Jp1sIeEl3nfAmSnE4
 8WLQU8WjI+GL8lKOm/3oXXDqXLsnTdBh8FGny+MI6A0wr3II87IPbL82QriX4rQEnr4H3M84
 vRDWf9Xj3nWLoHP0NukdIYPZ1wZxryOErc6zeCHw081p0v1v0s1p0s1JlACiAgSwSrVCrohT
 hkvUUoVakyqXxKUpTMBzAeLoBnD77qzECjAKWAGkcJG/wKqtkfsK4qXHjrOqtFiVJoVVW0Ew
 RYiEgiUpefG+tFyaziazrJJV/fvFKF5QFlbIj8yZn/Bd8jqfZ2yxbSvinVmcW0w9ezhUPTU4
 YQ7BWzSWbqr6TKZ8o/jql9h1IQd4zFjtJisdmFszuzqDnxHzbfGAuFKk3PGrd+9R8vEVLDQk
 aTw3YfvO5lNX3gmGbXccW/a+msrU7nxanjyiWb41KuaEsDHzYNSyCIF5T1lPV9pks/6RIcvn
 5Cpp31p9k+Xqg9CaFe32+b/kuyfybdur1xpkhi12o9hx88DgSpkid/x4RLD28I8uYWqd/e6D
 ZfvL1tsCOvbJCrT5zrjW6S6ZK8EUXTUjr7pu/50t+fnBNDzd2xT0UVU4fvrQLb8FNQGM4uKK
 jCZhr4KcxpLznMtFhDpRGi7GVWrpH0u44rdwAwAA
X-CMS-MailID: 20250218035521epcas5p26e1a209f2c2e7ab1a3647c92a8b80923
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
 <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
 <011901db80fb$8e968f60$abc3ae20$@samsung.com>
 <18746e2f-4124-4f85-97d2-a040b78b4b34@lunn.ch>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 ravi.patel@samsung.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 'Pankaj	Dubey' <pankaj.dubey@samsung.com>, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS
 device tree bindings
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
> Sent: 17 February 2025 20:48
> To: Swathi K S <swathi.ks@samsung.com>
> Cc: krzk+dt@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
'Pankaj
> Dubey' <pankaj.dubey@samsung.com>; ravi.patel@samsung.com
> Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
> bindings
> 
> > > > > > +  phy-mode:
> > > > > > +    enum:
> > > > > > +      - rgmii-id
> > > > >
> > > > > phy-mode is normally a board property, in the .dts file, since
> > > > > the board
> > > > might
> > > > > decide to have extra long clock lines and so want 'rgmii'.
> 
> > Hi Andrew,
> > What you said is right. Generally, PCB provides internal delay.
> 
> It is actually pretty unusual for the PCB to add the delays. But there are
some
> boards which do this. Which is why you should support it.
> 
> > But in this case, due to customer request, the delay was added into SoC.
> 
> Idealy, by the PHY. However, in terms of DT, the board .dts file just
needs to
> say 'rmgii-id', meaning that the board does not provide the delays, so the
> MAC/PHY pair needs to provide the delay.
> 
> > The following doc on rgmii says that "Devices which implement internal
> > delay shall be referred to as RGMII-ID.
> > Devices may offer an option to operate with/without internal delay and
> > still remain compliant with this spec"
> >
> https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-
> proces
> > sors/2
> > 0655/1/RGMIIv2_0_final_hp.pdf
> >
> > Also, the driver is in such a way that it handles all four rgmii in
> > the same way.
> >
> > Considering this, could you let us know what will be the right
> > approach to take in this case?
> 
> List all four phy-modes in the binding. They should all be valid. However,
the
> .dtsi file should not list a phy-mode, since it is a board property, not a
SoC
> property.

Hi Andrew, 
Thanks for the clarification.
Will post v7 with the following updates:

1. Changing phy-mode in dt-binding as shown below:
  phy-mode:
    enum:
      - rgmii
      - rgmii-id
      - rgmii-rxid
      - rgmii-txid
	  
2. Removing phy-mode from .dtsi and example given in dt-binding
3. Add phy-mode to .dts file and specify 'rgmii-id' there.

Hope this will address your review comment.

Thanks,
Swathi

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
