Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9585ED3
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Aug 2019 11:39:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 729CBC35E01;
	Thu,  8 Aug 2019 09:39:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A057BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2019 09:39:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x789cIQd023410; Thu, 8 Aug 2019 11:38:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rfAy2kQie5nyqet5futdME6zq6BbLniw6BappTO8JW8=;
 b=bZw3ufJS0Ny+6r7smXCGChSxzXuJohT5YuZKYP1I1STBqCiHttUYNKPztyOe3HPD3ezE
 00qBEr8ooA9XY7NWjJSrQm8yN9iAWoGSKfzGkM+8KTp5oFvUlJvRCYHxAUd53g7tDU2V
 bfBVvIA/bwifv9nZiJVrCb7ZV3fUGU2p9Ao4zvD1XuKdY5yOpU9CVzV6Pdf59cBjfurz
 sChiUvSoCuJVF3Iw1e1yPDyLh6jzdK+En+LVy0KVIwqG1oYXhRh6uu9SRAf3WBz0haBa
 NPrkaYgnJxtlyIuoI/QlmfjOWQiomFLAZf/ACwBAczRiCPu7Iazvf++zx+AlS5TiPgSu Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u515mvb4c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 08 Aug 2019 11:38:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 468F938;
 Thu,  8 Aug 2019 09:38:03 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22B312DAD65;
 Thu,  8 Aug 2019 11:38:03 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 11:38:02 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Thu, 8 Aug 2019 11:38:02 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v4 0/3] DCMI bridge support
Thread-Index: AQHVTQkgTcvIjOQmAEWftzhpiuOH2qbw3leA
Date: Thu, 8 Aug 2019 09:38:02 +0000
Message-ID: <85edd40f-68cc-13aa-52e0-6ec832bf6c2f@st.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
 <28a2a9ac-d5b9-a312-616a-620e0385cf66@xs4all.nl>
In-Reply-To: <28a2a9ac-d5b9-a312-616a-620e0385cf66@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <68E7D2C351D66940A2DE53144A771ACE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-08_05:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 0/3] DCMI bridge support
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

Hi Hans,

You're welcome, here it is:

1) v4l-utils master branch, commit 
6aa15f7447d4aeca6af1ed7ee9644a0c7e891ece "v4l2-ctl: fix double 
decrementing of stream_count"

2) Cropping test is failed as usual because of OV5640 discrete framesizes

3) No more /dev/media* and /dev/v4l-*:
root@stm32mp1-av96:~# ls -al /dev/video0
crw-rw---- 1 root video 81, 0 Mar 19 17:42 /dev/video0
root@stm32mp1-av96:~# ls -al /dev/media*
ls: cannot access '/dev/media*': No such file or directory
root@stm32mp1-av96:~# ls -al /dev/v4l-*
ls: cannot access '/dev/v4l-*': No such file or directory


root@stm32mp1-av96:~# v4l2-compliance -s
v4l2-compliance SHA: 6aa15f7447d4aeca6af1ed7ee9644a0c7e891ece, 32 bits

Compliance test for stm32-dcmi device /dev/video0:

Driver Info:
         Driver name      : stm32-dcmi
         Card type        : STM32 Camera Memory Interface
         Bus info         : platform:dcmi
         Driver version   : 4.19.49
         Capabilities     : 0x85200001
                 Video Capture
                 Read/Write
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x05200001
                 Video Capture
                 Read/Write
                 Streaming
                 Extended Pix Format

Required ioctls:
         test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
         test second /dev/video0 open: OK
         test VIDIOC_QUERYCAP: OK
         test VIDIOC_G/S_PRIORITY: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
         test VIDIOC_LOG_STATUS: OK

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
         test VIDIOC_QUERYCTRL: OK
         test VIDIOC_G/S_CTRL: OK
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 18 Private Controls: 0

Format ioctls (Input 0):
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
         test VIDIOC_G/S_PARM: OK
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK
         test VIDIOC_TRY_FMT: OK
         test VIDIOC_S_FMT: OK
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
                 fail: 
../../../../../../../../../sources/v4l-utils/utils/v4l2-compliance/v4l2-test-formats.cpp(1414): 
node->frmsizes_count[pixfm
t] > 1
         test Cropping: FAIL
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
         test VIDIOC_EXPBUF: OK
         test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
         test read/write: OK
         test blocking wait: OK
         test MMAP (no poll): OK
         test MMAP (select): OK
         test MMAP (epoll): OK
         test USERPTR (no poll): OK (Not Supported)
         test USERPTR (select): OK (Not Supported)
         test DMABUF: Cannot test, specify --expbuf-device

Total for stm32-dcmi device /dev/video0: 51, Succeeded: 50, Failed: 1, 
Warnings: 0


On 8/7/19 12:15 PM, Hans Verkuil wrote:
> Hi Hugues,
> 
> Can you provide the output of the most recent v4l2-compliance?
> 
> Use 'v4l2-compliance -s'.
> 
> Also, just to confirm, with this v4 there are no /dev/mediaX or
> /dev/v4l-subdevX devices created anymore, right?
> 
> This v4 looks good to me, I just want to have these final checks
> done.
> 
> Regards,
> 
> 	Hans
> 

Best regards,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
