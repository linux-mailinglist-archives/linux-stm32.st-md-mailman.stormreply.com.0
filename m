Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAC9378DF
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2024 16:01:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00494C7801B;
	Fri, 19 Jul 2024 14:01:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3E10C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 14:01:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JCVfr5002454;
 Fri, 19 Jul 2024 14:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0iOXd/KnUcqhuwFmJpV0aD60W+/rKAO1g0GIgi7G9dU=; b=LYyJO9njjal2idWQ
 pHOhc9v48Y3mFXXbo69osK52dhN/D2QEB1m6pC0VT4I8cWFE6izJVlgjMwNnXolR
 ukdcCv907hcFc3z5BaSFy2wnlJpSuGYRw4Zt5qMUJhnOF3k0Ds/1r/rAEu3sMBaR
 milE/AgVpodAQ976/mWxTO9CfzNtOrQiai5WaOGn08hjuBVDuDDa8bKhY6RgDjRz
 p0UGJ/xbZv/pSTN8VVHBMVXj7UhG3xtqyRdt6RhNvIdiwv66z5tvUIMNbRA+R7RN
 FdN5SwAgonLbrA6yAjkBbAsg38Q2rnC1O4iKS7dmylnlLecD8O8nA19F7zuFDW9u
 j62hpw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe94sm9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 14:00:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46JE0J7r027068
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 14:00:19 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 07:00:18 -0700
Message-ID: <55341a0d-b07b-4f25-be45-dd0b352315aa@quicinc.com>
Date: Fri, 19 Jul 2024 07:00:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
 <bdac7f10-4c65-4be2-952b-aed1af04e2c9@app.fastmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <bdac7f10-4c65-4be2-952b-aed1af04e2c9@app.fastmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sg1Ff6mAFYU0BUKqF12MoFAl9ng0bFVC
X-Proofpoint-ORIG-GUID: sg1Ff6mAFYU0BUKqF12MoFAl9ng0bFVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190107
Cc: Peter Zijlstra <peterz@infradead.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 Karol Herbst <karolherbst@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] MODULE_DESCRIPTION() patches with no maintainer
	action
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

On 7/19/2024 3:51 AM, Arnd Bergmann wrote:
> On Sun, Jul 14, 2024, at 23:46, Jeff Johnson wrote:
>> Andrew & Greg,
>>
>> I hate to bother you with such mundane patches, but the following have been
>> posted for a while without any maintainer or reviewer comment or action, and
>> they have not yet landed in linux-next.
>>
>> What is the path forward to have these MODULE_DESCRIPTION() warnings fixed?
>>
>> arch/arm/probes/kprobes/
>> https://lore.kernel.org/all/20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com/
>>
>> arch/x86/mm/
>> https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/
>>
>> drivers/spmi/
>> https://lore.kernel.org/all/20240609-md-drivers-spmi-v1-1-f1d5b24e7a66@quicinc.com/
>>
>> (note that beyond these 3 patches I still have an additional 13 patches which
>> need to land in order to fix these warnings tree-wide, but those 13 patches
>> have had recent maintainer or reviewer action so I'm not seeking your help at
>> this time).
> 
> Hi Jeff,
> 
> For completeness, this is a patch that I have in my local
> test tree now after I addressed the build issues for all
> randconfig builds on arm, arm64 and x86.
> 
> I assume you already a version of most of these,
> but please have a look in case there are some still
> missing.

You have found and fixed some that I didn't encounter with make allmodconfig
builds. I do have a list of ones for further analysis that I created by
looking for files with a MODULE_LICENSE but not a MODULE_DESCRIPTION, and the
ones I haven't yet fixed are on that list, but I'm very happy for you to
submit your fixes.

Details follow:

>  arch/arm/lib/xor-neon.c                         | 1 +
https://lore.kernel.org/all/20240711-md-arm-arch-arm-lib-v2-1-ab08653dc106@quicinc.com/

>  arch/x86/mm/testmmiotrace.c                     | 1 +
https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/

>  drivers/fpga/tests/fpga-bridge-test.c           | 1 +
>  drivers/fpga/tests/fpga-mgr-test.c              | 1 +
>  drivers/fpga/tests/fpga-region-test.c           | 1 +
I do not have a patch for these three

>  drivers/fsi/fsi-core.c                          | 1 +
>  drivers/fsi/fsi-master-aspeed.c                 | 2 ++
>  drivers/fsi/fsi-master-ast-cf.c                 | 1 +
>  drivers/fsi/fsi-master-gpio.c                   | 1 +
>  drivers/fsi/fsi-master-hub.c                    | 1 +
>  drivers/fsi/fsi-scom.c                          | 1 +
https://lore.kernel.org/all/20240605-md-drivers-fsi-v1-1-fefc82d81b12@quicinc.com/

>  drivers/xen/xenbus/xenbus_probe_frontend.c      | 1 +
I do not have a patch for this one

>  fs/adfs/super.c                                 | 2 ++
https://lore.kernel.org/all/20240523-md-adfs-v1-1-364268e38370@quicinc.com/

>  fs/exportfs/expfs.c                             | 1 +
I do not have a patch for this one

>  kernel/locking/test-ww_mutex.c                  | 1 +
https://lore.kernel.org/all/20240528-md-test-ww_mutex-v2-1-a2a19e920b12@quicinc.com/

>  lib/asn1_decoder.c                              | 1 +
>  lib/slub_kunit.c                                | 1 +
>  lib/ucs2_string.c                               | 1 +
>  lib/zlib_inflate/inflate_syms.c                 | 1 +
I do not have a patch for these four

>  mm/kasan/kasan_test.c                           | 1 +
>  mm/kasan/kasan_test_module.c                    | 1 +
I do not have a patch for these two

>  samples/livepatch/livepatch-callbacks-busymod.c | 1 +
>  samples/livepatch/livepatch-callbacks-demo.c    | 1 +
>  samples/livepatch/livepatch-callbacks-mod.c     | 1 +
>  samples/livepatch/livepatch-sample.c            | 1 +
>  samples/livepatch/livepatch-shadow-fix1.c       | 1 +
>  samples/livepatch/livepatch-shadow-fix2.c       | 1 +
I do not have a patch for these six

>  security/apparmor/policy_unpack_test.c          | 1 +
https://lore.kernel.org/all/20240529-md-apparmor_policy_unpack_test-v1-1-9efc582078c4@quicinc.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
