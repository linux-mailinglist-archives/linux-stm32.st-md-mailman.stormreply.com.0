Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F459A21BE5
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 12:15:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6991C78034;
	Wed, 29 Jan 2025 11:15:31 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84854C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 11:15:29 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250129111525epoutp015dfd4bd3b0bf3d68e3a8b305b4e0ce98~fJZpWHY9i2275322753epoutp01b
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 11:15:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250129111525epoutp015dfd4bd3b0bf3d68e3a8b305b4e0ce98~fJZpWHY9i2275322753epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738149326;
 bh=ORzWu070Dc1sPFdY/nRcTw3rBuHfHQm6t8J4vR0IHBY=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=K/2i6NTan7sz1MSbOergGIkMjeNo6V1ENW/Jl6juYj+wlaIxorhsb/TML8Ubnpdr1
 nsO7vJJuN/gPOdGSmTmlbIZaE9mzmQZlGW6wKW+nFH6JKsNhzZ9HmBs0+xyCCx9PhF
 /7lkVLtJTQv+SW+jFSNGvYP05jSg3zMqWCALjkIo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20250129111525epcas5p1172f617c8b0e5284462a77e1f8498f6f~fJZot7nT51243012430epcas5p1V;
 Wed, 29 Jan 2025 11:15:25 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4YjfhW39f8z4x9Pt; Wed, 29 Jan
 2025 11:15:23 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B5.54.19933.BCD0A976; Wed, 29 Jan 2025 20:15:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250129091920epcas5p1d52a471c6a58183398e3ffe90aae6b61~fH0SFwYBO2495124951epcas5p1c;
 Wed, 29 Jan 2025 09:19:20 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250129091920epsmtrp1d69deda336c075978233791ab417b143~fH0SEq6r-3020130201epsmtrp1Z;
 Wed, 29 Jan 2025 09:19:20 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-7d-679a0dcb9eb2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 58.23.23488.892F9976; Wed, 29 Jan 2025 18:19:20 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250129091916epsmtip202ff3b613561eae0ae91601235900e0e~fH0Oi4j8G1058510585epsmtip2w;
 Wed, 29 Jan 2025 09:19:16 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
In-Reply-To: <918d6885-969e-46f1-b414-614905b12831@kernel.org>
Date: Wed, 29 Jan 2025 14:49:14 +0530
Message-ID: <002e01db722e$e018b7e0$a04a27a0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDx5RsunPn3lkU9PtjwM0wRa6rGBAGX1K+vAlVxyCECT+N0J7TOqf7w
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHd/ve6ytmJU8UuCCY5i2OwQJSaOEyy49tBp+oGZtZTMi0a+hL
 S4C2aYuKy2KDuJRmA1En0AEyxDrZGJOfBeWHDEFEQeMgmAwCg3YKG3YyyBgwRnm48d/nfO/3
 nJNzbo4A8/qG9BekaYysXqPIoPlb8KYfg4NC+4VWVfjoPIUWn10CaLy8iY8GR7sw9F3bAA+V
 Dubi6HL3AIEcPb+Q6ElnCw9136viobHKWQINDv5AoodN+QSqmxwm0MT0EfS4tZSPigfbecgy
 PEWg8pUaAvVU+KCF/t8Aqmz8k0SrM40ATbhukcj60E6g7vtPMbR6y06iyvEKImEH03D9CY9x
 FDSSTIt1lGQq6rKYuuo8PlNfdZppsc/xmOftQ3wmv6EaMLfbxYzjrzaMaeiYA8w/OWUkM1e3
 M9kzJV2mZhVKVi9iNalaZZpGFUsfOCx/Vy6NCheHimNQNC3SKDLZWHrvweTQxLSMtZXQouOK
 jKw1KVlhMNC742R6bZaRFam1BmMszeqUGTqJLsygyDRkaVRhGtb4ljg8PEK6Zvw4XW0620Ho
 6j1P9vYvkyZge9UCPASQksDli424BWwReFE3AZx0Xt0IXgBoMdv4XLAAoK3ERViAYD1lrMyH
 09sAXLo+QHDBUwAr2u6Q7rp8KgRW5rev83YqFNaPXCPdJozqJ2Bn4xm++8GDioOLf5jWTduo
 Y7C/2IG7Gad2wWvNfeu6kIqBOSNmnOOtsK9kap0x6k1o+3oG44YQwUWHjeCaJULzahHBeXzh
 ncXPMXdjSDk94AVr7UbCXnhj4jKf421wureB5NgfPiv4bIPl8Nv8IZxjNRz9u3DDHw87fyrF
 3avAqGBY27qbkwPhl/e+53F9PeEXS1M8ThdCe/lLfg2uzAxvlPSDTVefk+cAbd00mnXTaNZN
 I1j/71YB8Grgx+oMmSrWINVFaNgT//14qjazDqyfTEiSHUyMu8K6AE8AugAUYPR24dGBYpWX
 UKnIPsXqtXJ9VgZr6ALStX0XYv7eqdq1m9MY5WJJTLgkKipKEhMZJaZ9hWdaclVelEphZNNZ
 VsfqX+bxBB7+Jl6gwSNG7YyWjiVO1bxirLo5L5MZIprje0fK9gT3WKXvWM6VHnRIKxpmUi48
 WHI9Usbb9+V+2r7SHik9771gostPF+Q9ig7a0SKV7N915OdUmfnA3QDfokBMgLxL79flRJiy
 K3NrryzcFc1GNuhstwPfbu1nOly/gqFPjhf9rnZ+NDzZfGx01tfu/EqYEhRbb7MsOemqdPD6
 qdhQsH8xKfvBctHefeatj8/78U4qEkLx8jatOQiqV6YPuS7Ja6Zl/JoFuXkx4USAfqcz7wPF
 nD7Jka90NU2VnH1hDMsy1XTOH8aVcVUfXgkfm6Ii9hyyvZF38f38oRvvCY4G9CkLfWjcoFaI
 QzC9QfEvMIwRs7sEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZdlhJXnfGp5npBg8f8Fj8fDmN0eLBvG1s
 FufvHmK2WLP3HJPFnPMtLBbzj5xjtXh67BG7xc0DO5ksjpxawmRxb9E7Vovz5zewW1zY1sdq
 senxNVaLh6/CLS7vmsNmMeP8PiaLrmtPWC3m/V3LanFsgZjFt9NvGC0Wbf3CbvH/9VZGi4cf
 9rBbzLqwg9XiyJkXzBb/9+xgt1j0YAGrg7THlpU3mTye9m9l99g56y67x4JNpR6bVnWyeWxe
 Uu+xc8dnJo/3+66yefRtWcXocXCfocfTH3uZPbbs/8zo8a9pLrvH501yAXxRXDYpqTmZZalF
 +nYJXBkNd++zFdznrTi58AJLA+Ml7i5GDg4JAROJe3PFuhi5OIQEdjNKzJ3Vw9bFyAkUl5T4
 1DyVFcIWllj57zk7RNEzRondO+4ygiTYBLQkFvXtYwexRQR0JTbfWA5mMwu8ZJU4uiYCouEt
 o8TdPU/BpnIK2En8/NjADrJZWCBGYv6xeJAwi4CqxPLtJ8F6eQUsJZpudLBA2IISJ2c+YYGY
 qS3R+7CVEcZetvA1M8RxChI/ny5jhbjBTaLj/3RWiBpxiaM/e5gnMArPQjJqFpJRs5CMmoWk
 ZQEjyypGydSC4tz03GTDAsO81HK94sTc4tK8dL3k/NxNjOAko6Wxg/Hdtyb9Q4xMHIyHGCU4
 mJVEeGPPzUgX4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrvSMCJdSCA9sSQ1OzW1ILUIJsvEwSnV
 wMTXn8K3RIwzJU7dMaxy31H/uUJOpyqOHp592dhu7Ryv4BrG/Ckaky7NYo/7+ouz/rra4/v3
 t7taHIlfq2Af1dr9ysd6zg11KYPs2+V/Hx99OSPIO1cov/aEZ4LG4Y0xeSL5b3f6ts1QPZ3U
 w7h7d+Cj4/PtH38++rHzyM2/hX9vB650iry5JOTq+Vt9xgq3E5mmOO7e8Xzyo2vJkZ473bgc
 Gn/otzco7J9oGXTb4prfnG+vQ3YLHjmRKmsvJ+rXqaTHVXt7bvuRLu8q0f8S8R+2WXpkTuuY
 ku/V0xZ2zGH3z9Bn93i1hSblma2eKrZEXCZLOG3bJMVtn7vvlZ5Zc7c3ekXGzi+1yZcbDr3b
 3KvEUpyRaKjFXFScCAASitQOoQMAAA==
X-CMS-MailID: 20250129091920epcas5p1d52a471c6a58183398e3ffe90aae6b61
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102743epcas5p1388a66efc96444adc8f1dbe78d7239b9
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102743epcas5p1388a66efc96444adc8f1dbe78d7239b9@epcas5p1.samsung.com>
 <20250128102558.22459-5-swathi.ks@samsung.com>
 <918d6885-969e-46f1-b414-614905b12831@kernel.org>
Cc: andrew@lunn.ch, jayati.sahu@samsung.com, edumazet@google.com,
 linux-fsd@tesla.com, alim.akhtar@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com, pankaj.dubey@samsung.com,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 4/4] arm64: dts: fsd: Add Ethernet
 support for PERIC Block of FSD SoC
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
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 28 January 2025 19:48
> To: Swathi K S <swathi.ks@samsung.com>; robh@kernel.org;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; andrew@lunn.ch; alim.akhtar@samsung.com;
> linux-fsd@tesla.com
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> alexandre.torgue@foss.st.com; peppe.cavallaro@st.com;
> joabreu@synopsys.com; rcsekar@samsung.com; ssiddha@tesla.com;
> jayati.sahu@samsung.com; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH v5 4/4] arm64: dts: fsd: Add Ethernet support for PERIC
> Block of FSD SoC
> 
> On 28/01/2025 11:25, Swathi K S wrote:
> >
> >  &pinctrl_pmu {
> > diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
> b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > index cc67930ebf78..670f6a852542 100644
> > --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> > +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > @@ -1027,6 +1027,33 @@
> >  			phy-mode = "rgmii-id";
> >  			status = "disabled";
> >  		};
> > +
> > +		ethernet_1: ethernet@14300000 {
> 
> Don't add nodes to the end, because that lead to mess we have there.
> Squeeze it somewhere where impact on resorting would be the smallest.

Just to clarify,  inserting the node somewhere in the middle, where it fits alphabetically, would minimize the impact on resorting.
Is my understanding correct?

-Swathi

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
