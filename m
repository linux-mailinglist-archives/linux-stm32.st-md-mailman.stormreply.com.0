Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C10C3FE0F
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 13:19:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35B32C5F1F4;
	Fri,  7 Nov 2025 12:19:08 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D97CDC5F1CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1762517615; x=1763122415; i=markus.elfring@web.de;
 bh=gh34AbndNywb05Tdrv4hfUW+KpGu4PIlF7KQldm2Ahc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kqXUlxvh46iY0aZHv+TgjUUUmy6KwdG85mJvHwHzCIUAdazGB9fYcrW71s8HECgh
 OJU3LIn5ejUPuJkJtumHHJqKWw5Lk0O4IqlNLpF111NigmvMzaqsfLuj59pMseJC3
 hpa1tEbRZePY9Fwb3L0qtUcIl48sB9kuvhAaWXATrJf/JQUQDhA8k7/azaMpoilFK
 RQgGEaDonhIQReqvTqhw1Pg6NguDc7Mcwg10ijXeV2Cj/tfsVyrcufslkySRGmHLq
 fr1UQ2nfjXuN1FpfDze8tdwjijN5K5iqyKN25H8KlSc2F5gIQ/94BWUajFcfVUZjC
 tWNTPevUUecK5zQ3yQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.187]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8T7E-1vLlCJ2mUS-00EVzZ; Fri, 07
 Nov 2025 13:13:35 +0100
Message-ID: <7857ab09-7808-4abe-9df1-66235291436b@web.de>
Date: Fri, 7 Nov 2025 13:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liyuan Pang <pangliyuan1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20251107100057.1091153-1-pangliyuan1@huawei.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251107100057.1091153-1-pangliyuan1@huawei.com>
X-Provags-ID: V03:K1:WjGEBZcugvueK22o/z6jyun4bxJP6+QGZkpKqoKtoo4w/XAoiFQ
 ZyTitNDrAMZlc8eVCx2rXH/HHJH5W0hbgybCc43LNrd2vFwlyeLFJuRgR1x2dQwLny6lWS9
 wk15W/fppL5wd87VP8wcSLlHCxAXEF0il/pMUiC4ShNJutzq0LUPL24hLjPuOO++lPVOaL4
 FEMXL0u0RvFqt8Eyi30Iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UIWbAsr5TsQ=;5KN0ScWvAXDZ0O6hEkDb6zFWoBI
 CxH/AEZsAfr1z35/pv28rD/TX78jXy4yFLHlRgzlJwFBkXwVYjgRhyD3E2D7gvsR0vmhcVbEC
 AAyFZviGT6DrIlggAFtIqo/8y/EvR+ne/D+zBZTNk7b8SL3F713g3N7n20N8XAmAvhRKspMhq
 4QbngozmZuY+CBRBBnKCSYeZ/BdvBW8FHLoHNu12wbFwA6MLEiu0L3FQCT5IHkfEx4Uj+ngyg
 L2x2eA6qGmWwDjuI2gAX3sqReVXNx0y0Y1VHN4nk1nTZkdk1Zu9NQF051AogDC02Wc4Du56sK
 gsfC9xpYUPB2oyIjSObTrFD9a1QBW9d1gebVcb7zz1wU2+7pKO3VyDokK5h9tsP+7XVRnOQ8l
 Bd4E4aT7Z9c7MrsMdvmmBRMw+csvMcnahfnR8f12crj0uHBlcY4bWLI0wj0wGWNfk9OnBIgTJ
 cLySQGIP/o8SrtvCGzc05d+bDr5Csx7Br7FW2daGVJR4bYMxSqg+sXgJcWlrWol7P9eM22R3i
 wjtdpOKMOOLKVcqgXvNRTlEhy6jsjKJPmt/VcqytwAQPwUuALCWp+4YxvSrN4YS4SWvOLcr6b
 zKCY8mZe9eL2k1UNKVCZyoYq9oQZb45+lWkigimQ9gPOHDn3A5AQGM1dj/gRaCvsGFzuCtDXS
 N7hdg4xkesrBYnkhO2Pt0j/S+0SI5jpsSPMWi4jnLWQgga3rlm7zOMRuj25vHJtkRfjohGDiS
 6cjNCgc0gEJMUeuZwRf1p1SUJW8WXMixqNF40oyd524VrhwmhQQOlJmr02JBph4hOy83LZ08D
 PQUAdl5i9ult19gtnfdcH+FvqFoS8ZRnNMeZSGxJZGMeuzmGvu4lS+X1f+P73vGdk5Kki90kx
 p6TLVWCU37YOO5RTyexrFqHMgioki6OtBgAA1hfRMftq9RYxE14ZU2d4TK1Dg+tL2NLETrN1G
 TqLEW6sjFClxVpPzlP/almTcSbkg/a756hDutsXiJ+hNa8s3d+OBhPAzuIc0D04N/YfzayYnR
 g/MueKD84LsISRM1SUBHxG6Cvzk7YSiOYIHQbop2Ql5s3Kvp3kFANwyBi8PXLNZ7E3mFucZ+l
 KEXxQo4ehClVGSutxuE/kQPm7DeRGo+/5Ac6xeFJwtOKfa908Mw2a+CVVUR0wrZW3bo5M/2tk
 j/4FFCh4EWe1hyxWAVzlwXU+7Guugjk2thDXQB9x7x123a+SD/jXanpGhqHvn4KKJHKdHXYDb
 rNwN0so4okf2VYqUZjZWssw3lrGJSTGbZuhNq7VgRYnVHvQRIoqU91fXO+n/qmUUvziuCYYX4
 olkmFaxHMMBcYoQ1kKGUnUDRdfnmA+pkcf8LkyS4XsIg6FY3ywnf3LIOOBAGQBPAa0PIfZ3lY
 eZBn/VuX2D9bulJ3mEpBzUL5BpGXCbJbdLzvIk6jGB3FYxIq5gj3lpwdKqRg2rslyCrFbAnuJ
 z/Escx74eakIiWVBhInDToMBUvWNuhTpJxQE6+fPKeircB8tq5ZOsMX0yC7KAbYK3q3o+ZBAc
 XfziZIzMuJOd2yiJj6x0BbWgDw0ITL9YLm7qiUMqRv0T6vWRvh0YxFRhOhWaCr18bed0WPEdj
 KJOFtn2p/SeEVdaTqyBvKAo2dg7eja+NcQWEmE5j69CwDiIS3N2XjXbSTFKEwO3B+eyEVltEi
 OequPISt+Crw71oHU998DFJdsUw0skej+LwHg41ZNacLjPEaPhwl1N9r7FcmOS9Z4v42uunot
 byXN9dXl/tKG9NdlBw7li8fqPZEMHKFWlNvWwT3vo7jiO6gS6kh62wY7t5p6heDEqgVtr+H9C
 RID8X4w87tMbNea1WFfxbjh1CWkPHxFDe8yVPsa39nZJ+n7cExSRbmE7dxYlAiQD+l4SmQCcW
 jAkOhsWKShZxeisLSeZ1DTCnbS86tFjSDMaOrcdSKUE2jPukYkCjsVoIc71haDYW9E/jpO1rR
 ty6YuFmn1fSqBwgca1+7w27RkOWSrPrXY7Mfpnn7O6CGQG8d2aCVlOcNBaKqxpLS9jYkpeFtd
 movIIUNtsCs90/hay2fWN6/GRL3HfZepxnFn8wISjN/DN2g5GnDh2gFJcoTbIreK51U13nrOM
 +7LLbA/a0UPsgKTPm88hcQjnSrUla9yM4R5Bo2kHH1Eew6ZuayhmqCD5Loj0JLcQLaUOrfs7C
 VhkXplA5niJOsfNPW3UkAC8yLtlFKBCUW7ZH7WZqQk/8qBr4QTmwnqdUsbij4/RMWTi3xvot+
 ZbeWNpweZ6c3rq1Z+HKfCyJ6CCmngUisUhjirdeYh1ehrypG8/JBg852owbi7Ep+xc3WX8ydC
 NzowbUiqn9WaxUzDt4ZkCMxlko6mD9eX97d4Q7/tclHfzhakI34kt3IVJgnGiEOsA6hVTWvu3
 lobwAXjRv9YX2bdf7izVmuLZ68s9vqN757N4TbEcr2kyMSANvK5hmwyE8pn/aaXcNsXFsR0eP
 /4FcGg8np0dJUm3W4lXjfhQWOpHIfdwxryr5qQZV/wlT3Ik7aB6uJKgbA5TyxlGldfTDB1itn
 8E8lD49LlJl6ClFIviT2uULPodhpeqHWkdEkFpzWfjttHV/ayc2c+OcqDKeUp/rQYOboZezRO
 VSUi1bR7NGbDUFqMhAfCkSmc0ftCUjHFqSWRlt5b/oBuBlN7Xght+6lmdp9WBJZSFJEbJmx40
 6FB2oMQ1jsK/wCMN+bgeXn4UfjsWnMjysj4rV3/N+0GXzBJJZNbKygHJmBDfLeDBDjfaxepUN
 s/iJe3EquFmZwFe54hQWtIFl0bAja3D0uXroOmRVQhGOWxKgEi0Eb3AYB3x4zdlAvLBfVly4D
 xTl+KSylLMKzej4N9C/pXXJ3P6Vd8PtuFpfaRtrB80prWV+7Mx34Ose70bYsv5Ij+vyokaRsn
 j5tUIMBirw3rGCvkDgJyX6NZOTpChkO82F2STiy0nDhSG3aXtD8UtC4y0ZK0LV0XyzefDqvCi
 DnhMf9CTQsPHw8RRRApJJ/i+WxcVcoqPMCP01T57h+/JD+PWP2L5EcnCnSe3gt3OPEQUDQa/x
 D5GIMEN0rzWGH4NP2mbbunjjNvu3YNOY1qkz/XbKcz+JWdDcG/f3BcJfdv6AtpVsNxYPSyS76
 EwV6P1ZCh1y5w8CGUHNGTBafJq0BEos98I+lVHie+AMGariBIG9qWrWz9uf5XvpRjDDkVJCZX
 hRL62CahN0MEr6zPcefj1vvcsSV/bj/z5HRsG5ajtRNd1nRWRpNeGUlYcRMPEp0LXXcf6wltf
 c2ZrJ1fpxHuXh6DdgEhwyfe2tJYLXcs5IiM/g24Rx0Si2jK5mLNlcNdd44Prvez9O4O6rh2HO
 OZwtPTZPv0pHp0jOTWFA61XT1M/vPdpE0gILLXIsuPktzB+Mc9EixciWYgF+gBpYSvsfIoPFj
 s8ojQsiwEgF4Rhy8X3HvBmgmqRcZs7NpCiTv+HfuHH4laQcYA94+zwzIzY31e9vIwQ1Cf3m0p
 qnxdLM4c1NCyrmX+OTBA6LX37lXcbc9SCjm4FsCM12+bMO1rzDk1M1MHkdtSKLyUdqskWuIgh
 XecEzv5g9yvmRDvhTAjU9cILbsq0mKTlGTdv6Hd/TV3Kn+6Vyr0OH5O8p83pBVgxncbJIdCp2
 E3k/ifIrE6NKOgQbDR7YzGEoQPQ2Oz/amzeCWYfr6VJx1zHA2i3Npkzbg1fgixV+O66PnZvcR
 I60OFJMRp1lzSxTRCpYQBdLy+ByGkjla9qqm/QYJfRogEmkqeLpMjoPZ+zDVf3BaFlbJgGTcZ
 M/vsD7OlWCB+GgJqLWvZIRFn+9BwayMofEQCEwKM+JDqKW9ZPvXrNaxWJNnY+NBk4tFbxmKI/
 sc0/GqV4d/zzTnYxRZ063P/esk02ROtt1U4AQRkZnXrXtCfcKm249IFRhOGBah0o8da+x237e
 w9aRoqDgEwzxaFjAH8LQ4Kh5v+KWbwib/kOV5OBN+nGM4Ie30pNq70dy1VRnBr8x3ts5tSlEf
 erKITgq62y7ZLUuXZxHJHPjZpsSDg1yL8D/Bc+oYjWDz4/8m/sNS86kKnoahmTlxCvhh6h00l
 P49H29tSB6o5Sv8cUalYrjVWX8IeH8p5LdSADDSmANFCC3hqWZVkRrBIXzB5StrBKof6TtB9i
 Cd86M+Vsq1bW8xpSGPmx/fRQoQ8IY4JzNYD2rERVYwNQTndJl4dFiZ5AHX6r9adKT+XXLXWmT
 7QUycgHRp2n6VnbpAAq8i69nhGOpcwGsEh4U/U9k7E7g93F2Y6JzMdzuciu6KijK3e5b2d7f9
 0c1H3YQUWEolwntYBgBk4fqDdxn38ov2Ob8MP7Km+QxcWrv4j3DdTZLbgH+Wuyv3J8/n++8ne
 3KtQK2PcnAsAMBnOSxcQNZruyl3X6FjTWzBV5mgbXhzUGTFw8gWP5VC567Q4hFJeBp0Iqcnt3
 7PdFBQdVRxADYyMtpNksxD+U08WAiDAi+e8uf32c7ZmGklVdaipSpSnP/HvWydzk/JOQeQWlf
 lIkc/3kpyVVFT7tvc3+99RgPvQoGWy7L7X7NKrC1kva3Bmvn8w11OEY6sqoVJTgzJelb1UqtD
 /tSE0P6v9XLVgfUMStLP4IhgwLd/ZtxNbXa3HkjkKD30HZzyR8tYo+E95YKg5Xde0VA4Wuh2e
 A8O/O6nERKcCNrg/I/nbIAzat9v8qige+B7aCp+2l2w8QODV9lZol3TYHtwR2jWAq3NObQoH6
 ykgQWWPxPpNqCGOgz0p10MpZQZeKCdpoBCZ0DbWkxOP+QUNoUPBEkyOAuAGviAm0nU6o5qykR
 TClJwbIgnB1PX99qYwdDnc/vc2DF91VGgWmf6wXJ3l8xo+GnnGE6QUSLqjZ9q/6GJxu/TncaJ
 DosaumRtgasYQ1xYbdHi1TuGc+gtf+5aRET/4dL+zmUBoAq2la45+AF0Ic/CXiBA0BmKMpofI
 lZi4HqzQT5XQexVSH06aKvmQsmGC/OZB2yT3wxipos42d0QYPdOq0YX0m8FM+48r4rzMJERGE
 oLF84V2whIRHUJlE+/mRB8ZLG1Y/yzanejaRptn/fa4heVkPuqCNfXDpUfejF7+dT0u9rnqV4
 2Ow/g==
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, Yang Liu <young.liuyang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, wanqian10@huawei.com
Subject: Re: [Linux-stm32] [PATCH v2] ubi: fastmap: fix ubi->fm memory leak
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHNjYW5fZmFzdCgpIGFsbG9jYXRlIG1lbW9yeSBmb3IgdWJp
LT5mbQo+IGFuZCB1YmktPmZtLT5lW3hdLCBidXQgaWYgdGhlIGZvbGxvd2luZyBhdHRhY2ggcHJv
Y2VzcyBmYWlscwrigKYKCllvdSBtYXkgb2NjYXNpb25hbGx5IHB1dCBtb3JlIHRoYW4gNjAgY2hh
cmFjdGVycyBpbnRvIHRleHQgbGluZXMKb2Ygc3VjaCBhIGNoYW5nZSBkZXNjcmlwdGlvbi4KaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/
aD12Ni4xOC1yYzQjbjY1OAoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
